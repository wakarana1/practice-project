# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_10_044431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "centers", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.string "name", null: false
    t.integer "rating", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["district_id"], name: "index_centers_on_district_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "households", force: :cascade do |t|
    t.bigint "tier_id"
    t.integer "household_size", null: false
    t.integer "income_max", null: false
    t.integer "income_min", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tier_id"], name: "index_households_on_tier_id"
  end

  create_table "tiers", force: :cascade do |t|
    t.bigint "district_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "oversize_increase", default: 0, null: false
    t.index ["district_id"], name: "index_tiers_on_district_id"
  end

  create_table "tuition_credits", force: :cascade do |t|
    t.bigint "tier_id"
    t.integer "rating", null: false
    t.integer "full_day_credit", null: false
    t.integer "half_day_credit", null: false
    t.integer "extended_day_credit", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tier_id"], name: "index_tuition_credits_on_tier_id"
  end

  add_foreign_key "households", "tiers"
  add_foreign_key "tuition_credits", "tiers"
end
