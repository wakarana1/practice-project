FactoryBot.define do
  factory :center do
    district
    name { Faker::Name.name }
    rating { Faker::Number.between(from: 1, to: 5) }
  end
end
