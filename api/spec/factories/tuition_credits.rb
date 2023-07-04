FactoryBot.define do
  factory :tuition_credit do
    tier
    rating { Faker::Number.number }
    full_day_tuition { Faker::Number.number }
    half_day_tuition { Faker::Number.number }
    extended_day_tuition { Faker::Number.number }
  end
end
