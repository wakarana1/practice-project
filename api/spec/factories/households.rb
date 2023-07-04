FactoryBot.define do
  factory :household do
    tier
    household_size { 2 }
    income_max { 18_310 }
    income_min { 0 }
  end
end
