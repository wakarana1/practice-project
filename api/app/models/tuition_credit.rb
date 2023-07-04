class TuitionCredit < ApplicationRecord
  belongs_to :tier

  validates :rating, :full_day_credit, :half_day_credit, :extended_day_credit, presence: true
end
