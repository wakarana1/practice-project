require 'rails_helper'

RSpec.describe 'tuition_credit query' do
  let!(:district) { create(:district) }
  let!(:tier) { create(:tier, district: district) }
  let!(:tuition_credit1) { TuitionCredit.create(tier: tier, rating: 1, full_day_credit: 626, half_day_credit: 313, extended_day_credit: 719) }
  let!(:tuition_credit2) { TuitionCredit.create(tier: tier, rating: 2, full_day_credit: 697, half_day_credit: 349, extended_day_credit: 802) }
  let!(:tuition_credit3) { TuitionCredit.create(tier: tier, rating: 3, full_day_credit: 804, half_day_credit: 402, extended_day_credit: 925) }

  it 'loads all tuition_credits available' do

    tuition_credits = [tuition_credit1, tuition_credit2, tuition_credit3]

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
end
