require 'rails_helper'

RSpec.describe Tier, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  describe 'associations' do
    it { is_expected.to belong_to(:district) }
    it { is_expected.to have_many(:households) }
    it { is_expected.to have_many(:tuition_credits) }

  end
end
