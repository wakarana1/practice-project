require 'rails_helper'

RSpec.describe 'tuition_credit query' do
  let!(:district) { create(:district) }
  let!(:tier) { create(:tier, district: district) }
  let!(:tuition_credit1) { TuitionCredit.create(tier: tier, rating: 1, full_day_credit: 626, half_day_credit: 313, extended_day_credit: 719) }
  let!(:tuition_credit2) { TuitionCredit.create(tier: tier, rating: 2, full_day_credit: 697, half_day_credit: 349, extended_day_credit: 802) }
  let!(:tuition_credit3) { TuitionCredit.create(tier: tier, rating: 3, full_day_credit: 804, half_day_credit: 402, extended_day_credit: 925) }

  it 'loads all tuition_credits available for a tier' do

    query = <<~GQL
    query getTuitionCredits {
      tuitionCredits(tierId: #{tier.id}) {
        id
        rating
        fullDayCredit
        halfDayCredit
        extendedDayCredit
      }
    }
    GQL

    tuition_credits = [tuition_credit1, tuition_credit2, tuition_credit3]
    tuition_credits_hash = tuition_credits.map do |tuition_credit|
      {
        'id' => tuition_credit.id.to_s,
        'rating' => tuition_credit.rating,
        'fullDayCredit' => tuition_credit.full_day_credit,
        'halfDayCredit' => tuition_credit.half_day_credit,
        'extendedDayCredit' => tuition_credit.extended_day_credit,
      }
    end


    result = TuitionApiSchema.execute(query)
    expect(result.dig('data', 'tuitionCredits')).to eq(tuition_credits_hash)
  end

  describe 'Lists TuitionCredits by Household Info' do
    let!(:household) { create(:household, :two, tier: tier) }

    it 'finds related tuitionCredits with under 8 in household' do
      district_id = district.id
      household_size = household.household_size
      income = 12000

      query = <<~GQL
        query tuitionCreditsThroughHousehold {
          tuitionCreditsThroughHousehold(districtId: #{district_id}, householdSize: #{household_size}, income: #{income}) {
            id
            rating
            fullDayCredit
            halfDayCredit
            extendedDayCredit
          }
        }
      GQL

      tuition_credits = [tuition_credit1, tuition_credit2, tuition_credit3]
      tuition_credits_hash = tuition_credits.map do |tuition_credit|
        {
          'id' => tuition_credit.id.to_s,
          'rating' => tuition_credit.rating,
          'fullDayCredit' => tuition_credit.full_day_credit,
          'halfDayCredit' => tuition_credit.half_day_credit,
          'extendedDayCredit' => tuition_credit.extended_day_credit,
        }
      end

      result = TuitionApiSchema.execute(query)
      expect(result.dig('data', 'tuitionCreditsThroughHousehold')).to eq(tuition_credits_hash)
    end

    it 'finds related tuitionCredits with over 8 in household' do
      create(:household, tier: tier, household_size: 8, income_min: 185_320, income_max: 0)

      district_id = district.id
      household_size = 10
      income = 223080

      query = <<~GQL
        query tuitionCreditsThroughHousehold {
          tuitionCreditsThroughHousehold(districtId: #{district_id}, householdSize: #{household_size}, income: #{income}) {
            id
            rating
            fullDayCredit
            halfDayCredit
            extendedDayCredit
          }
        }
      GQL

      tuition_credits = [tuition_credit1, tuition_credit2, tuition_credit3]
      tuition_credits_hash = tuition_credits.map do |tuition_credit|
        {
          'id' => tuition_credit.id.to_s,
          'rating' => tuition_credit.rating,
          'fullDayCredit' => tuition_credit.full_day_credit,
          'halfDayCredit' => tuition_credit.half_day_credit,
          'extendedDayCredit' => tuition_credit.extended_day_credit,
        }
      end

      result = TuitionApiSchema.execute(query)
      expect(result.dig('data', 'tuitionCreditsThroughHousehold')).to eq(tuition_credits_hash)
    end

    it 'ignores tuitionCredits in other tiers' do
      tier2 = create(:tier, district: district)
      household2 = create(:household, tier: tier2, household_size: 2, income_min: 18_311, income_max: 33_874)
      tier2_tuition_credit = TuitionCredit.create(tier: tier2, rating: 3, full_day_credit: 804, half_day_credit: 402, extended_day_credit: 925)

      district_id = district.id
      household_size = household2.household_size
      income = 19000

      query = <<~GQL
        query tuitionCreditsThroughHousehold {
          tuitionCreditsThroughHousehold(districtId: #{district_id}, householdSize: #{household_size}, income: #{income}) {
            id
            rating
            fullDayCredit
            halfDayCredit
            extendedDayCredit
          }
        }
      GQL

      tuition_credit_hash = [{
        'id' => tier2_tuition_credit.id.to_s,
        'rating' => tier2_tuition_credit.rating,
        'fullDayCredit' => tier2_tuition_credit.full_day_credit,
        'halfDayCredit' => tier2_tuition_credit.half_day_credit,
        'extendedDayCredit' => tier2_tuition_credit.extended_day_credit,
      }]

      result = TuitionApiSchema.execute(query)
      expect(result.dig('data', 'tuitionCreditsThroughHousehold')).to eq(tuition_credit_hash)
    end
  end
end
