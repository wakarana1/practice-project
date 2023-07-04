require 'rails_helper'

RSpec.describe 'tier query' do
  let!(:district) { create(:district) }
  let!(:tiers) { create_list(:tier, 10, district: district) }

  it 'loads all tiers available' do

    query = <<~GQL
      query getTiers {
        tiers(districtId: #{district.id}) {
          id
          name
        }
      }
    GQL

    tiers_hash = tiers.map do |tier|
      {
        'id' => tier.id.to_s,
        'name' => tier.name
      }
    end


    result = TuitionApiSchema.execute(query)
    expect(result.dig('data', 'tiers')).to eq(tiers_hash)
  end

  describe 'nested relations' do
    it 'loads households for tiers' do
      tier = tiers.first
      household = create(:household, tier: tier, household_size: 2, income_min: 0, income_max: 18_310)

      query = <<~GQL
      query getTiersAndHousehold {
        tiers(districtId: #{district.id}) {
          id
          name
           households {
            id
            incomeMin
            incomeMax
            householdSize
          }
        }
      }
      GQL

      tiers_hash = tiers.map do |tier|
        {
          'id' => tier.id.to_s,
          'name' => tier.name,
          'households' => tier.households.map do |household|
            {
              'id' => household.id.to_s,
              'incomeMin' => household.income_min,
              'incomeMax' => household.income_max,
              'householdSize' => household.household_size,
            }
          end
        }
      end

      result = TuitionApiSchema.execute(query)
      expect(result.dig('data', 'tiers')).to eq(tiers_hash)
    end

    it 'loads tuition_credits for tiers' do
      tier = tiers.first
      tuition_credit = TuitionCredit.create(tier: tier, rating: 1, full_day_credit: 626, half_day_credit: 313, extended_day_credit: 719)

      query = <<~GQL
      query getTiersAndTuitionCredits {
        tiers(districtId: #{district.id}) {
          id
          name
          tuitionCredits {
            id
            rating
            fullDayCredit
            halfDayCredit
            extendedDayCredit
          }
        }
      }
      GQL

      tiers_hash = tiers.map do |tier|
        {
          'id' => tier.id.to_s,
          'name' => tier.name,
          'tuitionCredits' => tier.tuition_credits.map do |tuition_credit|
            {
              'id' => tuition_credit.id.to_s,
              'rating' => tuition_credit.rating,
              'fullDayCredit' => tuition_credit.full_day_credit,
              'halfDayCredit' => tuition_credit.half_day_credit,
              'extendedDayCredit' => tuition_credit.extended_day_credit
            }
          end
        }
      end


      result = TuitionApiSchema.execute(query)
      expect(result.dig('data', 'tiers')).to eq(tiers_hash)
    end
  end
end
