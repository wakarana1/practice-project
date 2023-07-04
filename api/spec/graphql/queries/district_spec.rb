require 'rails_helper'

RSpec.describe 'district query' do
  let!(:districts) { create_list(:district, 10) }

  it 'loads all districts available' do

    query = <<~GQL
      query GetDistricts {
        districts {
          id
          name
        }
      }
    GQL

    district_hash = districts.map do |district|
      {
        'id' => district.id.to_s,
        'name' => district.name
      }
    end


    result = TuitionApiSchema.execute(query)
    expect(result.dig('data', 'districts')).to eq(district_hash)
  end
end
