# frozen_string_literal: true

module Types
  class TierType < Types::BaseObject
    field :id, ID, null: false
    field :district_id, Integer, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :households, [Types::HouseholdType], description: 'List of Household breakdowns, if any'
    field :tuition_credits, [Types::TuitionCreditType], description: 'List of Tuition Credits, if any'
  end
end
