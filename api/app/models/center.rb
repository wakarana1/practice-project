class Center < ApplicationRecord
  belongs_to :district

  validates :name, :rating, presence: true

  def self.parse_date(date)
    day, time_range = date.split('/')

    day_number = day.to_i

    start, close = time_range.split('-')

    opening_time = start.gsub(':','').to_i
    closing_time = close.gsub(':','').to_i

    {
      day: day_number,
      open: opening_time,
      closed: closing_time
    }

  end
end
