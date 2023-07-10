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

      # time_hash = [
      #   {
      #     day: 0,
      #     open: 600,
      #     closed: 1100
      #   },
      #   {
        #     day: 0,
        #     open: 1300,
      #     closed: 1959
      #   }
      # ]

      time_hash =
        {
          day: 0,
          open: 600,
          closed: 1100
        }


      expect(Center.parse_date(time)).to eq(time_hash)
    end
    # it 'parses incorrect data into a useable format' do
    #   time      = '-1/-'
    #   time      = '0/-'
    #   # time_list = '0/06:00-11:00, 0/13:00-19:59'

    #   time_hash = [
    #     {
    #       day: 0,
    #       open: 600,
    #       closed: 1100
    #     }
    #   ]

    #   expect().to eq()
    # end
  end
end
