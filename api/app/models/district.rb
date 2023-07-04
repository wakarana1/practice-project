class District < ApplicationRecord
  has_many :tiers

  validates :name, presence: true
end
