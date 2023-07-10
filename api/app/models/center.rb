class Center < ApplicationRecord
  belongs_to :district

  validates :name, :rating, presence: true

  def self.parse_date(center_hours)
    center_hours.split(', ').map do |date_thing|
      day, time_range = date_thing.split('/')
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
end
