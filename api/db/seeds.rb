# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Districts
district1 = District.create(name: "#{Faker::Address.city} Unified School District")
district2 = District.create(name: "#{Faker::Address.city} Unified School District")

# Centers
Center.create(district: district1, name: "#{Faker::Address.city} Childcare Center", rating: 1)
Center.create(district: district1, name: "#{Faker::Address.city} Childcare Center", rating: 2)
Center.create(district: district1, name: "#{Faker::Address.city} Childcare Center", rating: 3)
Center.create(district: district1, name: "#{Faker::Address.city} Childcare Center", rating: 4)
Center.create(district: district1, name: "#{Faker::Address.city} Childcare Center", rating: 5)

# Tiers for District 1
t1_d1 = Tier.create(district: district1, name: 'Tier 1')
t2_d1 = Tier.create(district: district1, name: 'Tier 2')
# Tiers for District 2
t1_d2 = Tier.create(district: district2, name: 'Tier 1')
t2_d2 = Tier.create(district: district2, name: 'Tier 2')

# Household for District 1 Tier 1
Household.create(tier: t1_d1, household_size: 2, income_min: 0, income_max: 18_310)
Household.create(tier: t1_d1, household_size: 3, income_min: 0, income_max: 23_030)
Household.create(tier: t1_d1, household_size: 4, income_min: 0, income_max: 27_750)
# Household for District 1 Tier 2
Household.create(tier: t2_d1, household_size: 2, income_min: 18_311, income_max: 33_874)
Household.create(tier: t2_d1, household_size: 3, income_min: 23_031, income_max: 42_606)

# Household for District 2 Tier 1
Household.create(tier: t1_d2, household_size: 2, income_min: 0, income_max: 15_310)
# Household for District 2 Tier 2
Household.create(tier: t1_d2, household_size: 3, income_min: 15_310, income_max: 30_874)

# TuitionCredit for District 1 Tier 1
TuitionCredit.create(tier: t1_d1, rating: 1, full_day_credit: 626, half_day_credit: 313, extended_day_credit: 719)
TuitionCredit.create(tier: t1_d1, rating: 2, full_day_credit: 697, half_day_credit: 349, extended_day_credit: 802)
TuitionCredit.create(tier: t1_d1, rating: 3, full_day_credit: 804, half_day_credit: 402, extended_day_credit: 925)
TuitionCredit.create(tier: t1_d1, rating: 4, full_day_credit: 849, half_day_credit: 425, extended_day_credit: 976)
# TuitionCredit for District 1 Tier 2
TuitionCredit.create(tier: t2_d1, rating: 1,	full_day_credit: 563, half_day_credit: 282, extended_day_credit: 648)
TuitionCredit.create(tier: t2_d1, rating: 2, full_day_credit: 627, half_day_credit: 314, extended_day_credit: 722)
TuitionCredit.create(tier: t2_d1, rating: 3, full_day_credit: 724, half_day_credit: 362, extended_day_credit: 833)

# TuitionCredit for District 2 Tier 1
TuitionCredit.create(tier: t1_d2, rating: 1, full_day_credit: 626, half_day_credit: 313, extended_day_credit: 719)
TuitionCredit.create(tier: t1_d2, rating: 2, full_day_credit: 697, half_day_credit: 349, extended_day_credit: 802)
TuitionCredit.create(tier: t1_d2, rating: 3, full_day_credit: 804, half_day_credit: 402, extended_day_credit: 925)
TuitionCredit.create(tier: t1_d2, rating: 4, full_day_credit: 849, half_day_credit: 425, extended_day_credit: 976)
# TuitionCredit for District 2 Tier 2
TuitionCredit.create(tier: t2_d2, rating: 1,	full_day_credit: 563, half_day_credit: 282, extended_day_credit: 648)
TuitionCredit.create(tier: t2_d2, rating: 2, full_day_credit: 627, half_day_credit: 314, extended_day_credit: 722)
TuitionCredit.create(tier: t2_d2, rating: 3, full_day_credit: 724, half_day_credit: 362, extended_day_credit: 833)