require 'rails_helper'

RSpec.describe TuitionCredit, type: :model do
  it { is_expected.to validate_presence_of(:rating) }
  it { is_expected.to validate_presence_of(:full_day_credit) }
  it { is_expected.to validate_presence_of(:half_day_credit) }
  it { is_expected.to validate_presence_of(:extended_day_credit) }

  describe 'associations' do
    it { is_expected.to belong_to(:tier) }
  end
end
