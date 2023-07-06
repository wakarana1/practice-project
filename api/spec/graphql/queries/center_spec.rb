require 'rails_helper'

RSpec.describe 'center query' do
  let!(:district) { create(:district) }
  let!(:centers) { create_list(:center, 10, district: district) }

  it 'loads all centers available in a district' do

    query = <<~GQL
      query getCenters {
        centers(districtId: #{district.id}) {
          id
          name
          rating
        }
      }
    GQL

    centers_hash = centers.map do |center|
      {
        'id' => center.id.to_s,
        'name' => center.name,
        'rating' => center.rating
      }
    end


    result = TuitionApiSchema.execute(query)
    expect(result.dig('data', 'centers')).to eq(centers_hash)
  end
end
