# frozen_string_literal: true

module Types
  class TuitionCreditType < Types::BaseObject
    field :id, ID, null: false
    field :tier_id, Integer
    field :rating, Integer, null: false
    field :full_day_credit, Integer, null: false
    field :half_day_credit, Integer, null: false
    field :extended_day_credit, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
