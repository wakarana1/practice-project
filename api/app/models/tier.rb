class Tier < ApplicationRecord
  belongs_to :district
  has_many :households
  has_many :tuition_credits

  validates :name, presence: true
end
