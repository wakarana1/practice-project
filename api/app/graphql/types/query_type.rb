module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :districts, [Types::DistrictType], null: false, description: "List of Districts"
    field :tiers, [Types::TierType], null: false, description: "List of Tiers by District ID" do
      argument :district_id, Integer
    end

    field :centers, [Types::CenterType], null: false, description: "List of Centers by District ID" do
      argument :district_id, Integer
    end

    field :households, [Types::HouseholdType], description: "List of Households by Tier ID" do
      argument :tier_id, Integer
    end

    field :tuition_credits, [Types::TuitionCreditType], description: "List of TuitionCredits by Tier ID" do
      argument :tier_id, Integer
    end

    field :tuition_credits_through_household, [Types::TuitionCreditType], description: "List of TuitionCredits by Household Info" do
      argument :district_id, Integer
      argument :household_size, Integer
      argument :income, Integer
    end

    field :tuition_options, [String], description: "List of Available Tuition Options"

    def districts
      District.all
    end

    def tiers(district_id:)
      Tier.where(district_id: district_id)
    end

    def centers(district_id:)
      Center.where(district_id: district_id)
    end

    def households(tier_id:)
      Household.where(tier_id: tier_id)
    end

    def tuition_credits(tier_id:)
      TuitionCredit.where(tier_id: tier_id)
    end

    def tuition_credits_through_household(district_id:, household_size:, income:)
      if household_size > 8
        tier = Tier.includes(:households, :tuition_credits).where(district_id: district_id).find do |tier|
          household         = tier.households.find_by(household_size: 8)
          oversize_increase = tier.oversize_increase
          increased_income  = oversize_increase * (household_size - 8)
          income_min        = household.income_min == 0 ? 0 : household.income_min + increased_income
          income_max        = household.income_max == 0 ? 0 : household.income_max + increased_income
          income <= income_max && income >= income_min
        end
      else
        households = Household.includes(tier: :district).where(district: {id: district_id})
        hh_table = Household.arel_table
        household = households.find_by(
          hh_table[:household_size].eq(household_size)
          .and(hh_table[:income_min].lteq(income))
          .and(hh_table[:income_max].gteq(income)
            .or(hh_table[:income_max].eq(0)) # for households that don't have a maximum
          )
        )
        tier = household.tier
      end
      tier&.tuition_credits
    end

    def tuition_options
      TuitionCredit::TuitionOptions::ALL
    end
  end
end
