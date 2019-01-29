# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_13_185821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_settings", force: :cascade do |t|
    t.datetime "opendate"
    t.integer "application_buffer"
    t.integer "contest_year"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "birth_year"
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.string "email_confirmation"
    t.string "workshop_selection1"
    t.string "workshop_selection2"
    t.string "workshop_selection3"
    t.string "lodging_selection"
    t.string "partner_registration_selection"
    t.string "partner_first_name"
    t.string "partner_last_name"
    t.string "how_did_you_hear"
    t.text "accessibility_requirements"
    t.text "special_lodging_request"
    t.text "food_restrictions"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "plan"
    t.string "description"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partner_registrations", force: :cascade do |t|
    t.string "description"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "transaction_type"
    t.string "transaction_status"
    t.string "transaction_id"
    t.string "total_amount"
    t.string "transaction_date"
    t.string "account_type"
    t.string "result_code"
    t.string "result_message"
    t.string "user_account"
    t.string "payer_identity"
    t.string "timestamp"
    t.string "transaction_hash"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workshops", force: :cascade do |t|
    t.string "instructor"
    t.string "last_name"
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "applications", "users"
  add_foreign_key "payments", "users"
end
