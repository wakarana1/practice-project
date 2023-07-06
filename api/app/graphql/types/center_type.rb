# frozen_string_literal: true

module Types
  class CenterType < Types::BaseObject
    field :id, ID, null: false
    field :district_id, Integer, null: false
    field :name, String, null: false
    field :rating, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
