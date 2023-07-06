FactoryBot.define do
  factory :household do
    tier
    trait :two do
      household_size { 2 }
      income_max { 18_310 }
      income_min { 0 }
    end
    trait :three do
      household_size { 3 }
      income_max { 23_030 }
      income_min { 0 }
    end
    trait :four do
      household_size { 4 }
      income_max { 27_750 }
      income_min { 0 }
    end
    trait :five do
      household_size { 5 }
      income_max { 32_470 }
      income_min { 0 }
    end
    trait :six do
      household_size { 6 }
      income_max { 37_190 }
      income_min { 0 }
    end
    trait :seven do
      household_size { 6 }
      income_max { 41_910 }
      income_min { 0 }
    end
    trait :eight do
      household_size { 6 }
      income_max { 46_330 }
      income_min { 0 }
    end
  end
end