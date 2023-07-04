require 'rails_helper'

RSpec.describe Household, type: :model do
  it { is_expected.to validate_presence_of(:household_size) }
  it { is_expected.to validate_presence_of(:income_min) }
  it { is_expected.to validate_presence_of(:income_max) }

  describe 'associations' do
    it { is_expected.to belong_to(:tier) }
  end
end
