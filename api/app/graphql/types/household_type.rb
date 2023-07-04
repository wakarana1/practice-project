# frozen_string_literal: true

module Types
  class HouseholdType < Types::BaseObject
    field :id, ID, null: false
    field :tier_id, Integer
    field :household_size, Integer, null: false
    field :income_max, Integer, null: false
    field :income_min, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
