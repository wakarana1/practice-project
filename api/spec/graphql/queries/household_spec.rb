require 'rails_helper'

RSpec.describe 'household query' do
  let!(:district) { create(:district) }
  let!(:tier) { create(:tier, district: district) }
  let!(:household1) { create(:household, tier: tier, household_size: 2, income_min: 0, income_max: 18_310) }
  let!(:household2) { create(:household, tier: tier, household_size: 3, income_min: 0, income_max: 23_030) }
  let!(:household3) { create(:household, tier: tier, household_size: 4, income_min: 0, income_max: 27_750) }

  it 'loads all households available' do

    households = [household1, household2, household3]

    query = <<~GQL
    query getHouseholds {
      households(tierId: #{tier.id}) {
        id
        householdSize
        incomeMin
        incomeMax
     }
   }
    GQL

    households_hash = households.map do |household|
      {
        'id' => household.id.to_s,
        'householdSize' => household.household_size,
        'incomeMin' => household.income_min,
        'incomeMax' => household.income_max
      }
    end


    result = TuitionApiSchema.execute(query)
    expect(result.dig('data', 'households')).to eq(households_hash)
  end
end
