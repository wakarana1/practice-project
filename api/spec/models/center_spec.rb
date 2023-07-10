require 'rails_helper'

RSpec.describe Center, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:rating) }

  describe 'associations' do
    it { is_expected.to belong_to(:district) }
  end

  describe 'parses date string' do
    let!(:center) { create(:center) }
    it 'correctly breaks down string into useable info' do
      time      = '0/06:00-11:00'
      # time_list = '0/06:00-11:00, 0/13:00-19:59'

      expect().to eq()
    end
  end
end
