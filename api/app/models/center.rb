class Center < ApplicationRecord
  belongs_to :district

  validates :name, :rating, presence: true
end
