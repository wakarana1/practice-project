class TuitionCredit < ApplicationRecord
  belongs_to :tier

  validates :rating, :full_day_credit, :half_day_credit, :extended_day_credit, presence: true

  module TuitionOptions
    ALL = [
      FULL_DAY_CREDIT = "Full Day Credit",
      HALF_DAY_CREDIT = "Half Day Credit",
      EXTENDED_DAY_CREDIT = "Extended Day Credit"
    ].freeze
  end
end
