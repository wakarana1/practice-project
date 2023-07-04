class Household < ApplicationRecord
  belongs_to :tier

  validates :household_size, :income_max, :income_min, presence: true
end
