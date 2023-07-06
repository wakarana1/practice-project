require 'rails_helper'

RSpec.describe Center, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:rating) }

  describe 'associations' do
    it { is_expected.to belong_to(:district) }
  end
end
