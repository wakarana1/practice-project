require 'rails_helper'

RSpec.describe District, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  describe 'associations' do
    it { is_expected.to have_many(:tiers) }

  end
end
