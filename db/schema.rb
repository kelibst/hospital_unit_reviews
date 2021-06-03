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

ActiveRecord::Schema.define(version: 2021_06_03_062606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "role"
    t.string "email"
    t.string "phone"
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "email_confirmed", default: false, null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.index ["hospital_id"], name: "index_administrators_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.string "country"
    t.string "region"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviewers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "phone"
    t.bigint "hospital_id", null: false
    t.string "activecode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false, null: false
    t.datetime "activecode_sent_at"
    t.index ["hospital_id"], name: "index_reviewers_on_hospital_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "score"
    t.bigint "unit_id", null: false
    t.bigint "reviewer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
    t.index ["unit_id"], name: "index_reviews_on_unit_id"
  end

  create_table "unit_t0_reviews", force: :cascade do |t|
    t.bigint "unit_id", null: false
    t.bigint "reviewer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reviewer_id"], name: "index_unit_t0_reviews_on_reviewer_id"
    t.index ["unit_id"], name: "index_unit_t0_reviews_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "unithead"
    t.bigint "administrator_id", null: false
    t.bigint "hospital_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["administrator_id"], name: "index_units_on_administrator_id"
    t.index ["hospital_id"], name: "index_units_on_hospital_id"
  end

  add_foreign_key "administrators", "hospitals"
  add_foreign_key "reviewers", "hospitals"
  add_foreign_key "reviews", "reviewers"
  add_foreign_key "reviews", "units"
  add_foreign_key "unit_t0_reviews", "reviewers"
  add_foreign_key "unit_t0_reviews", "units"
  add_foreign_key "units", "administrators"
  add_foreign_key "units", "hospitals"
end
