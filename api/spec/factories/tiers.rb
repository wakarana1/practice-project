FactoryBot.define do
  factory :tier do
    district
    name { Faker::Name.name }
  end
end
