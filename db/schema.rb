# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150715091300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "full_name",                 default: "", null: false
    t.string   "street_address",            default: "", null: false
    t.string   "city",           limit: 25, default: "", null: false
    t.string   "state",          limit: 25, default: "", null: false
    t.string   "country",        limit: 25, default: "", null: false
    t.integer  "zip_code",                               null: false
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "catering_companies", force: :cascade do |t|
    t.string   "name",                          default: "",    null: false
    t.text     "description",                   default: "",    null: false
    t.integer  "number_of_employes",            default: 1,     null: false
    t.boolean  "female_servers",                default: false, null: false
    t.boolean  "arabic_speaking",               default: false, null: false
    t.integer  "sitting_capacity",              default: 1,     null: false
    t.string   "contact_number",                                null: false
    t.string   "address",                       default: "1",   null: false
    t.string   "city",               limit: 25, default: "",    null: false
    t.string   "state",              limit: 25, default: "",    null: false
    t.string   "country",            limit: 25, default: "",    null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "deals", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.text     "description", default: "", null: false
    t.float    "price",                    null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "deals_food_items", id: false, force: :cascade do |t|
    t.integer "food_item_id"
    t.integer "deal_id"
  end

  add_index "deals_food_items", ["food_item_id", "deal_id"], name: "index_deals_food_items_on_food_item_id_and_deal_id", using: :btree

  create_table "food_item_add_ons", force: :cascade do |t|
    t.string   "name",          default: "", null: false
    t.integer  "food_items_id"
    t.float    "price",                      null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string   "name",                  default: "", null: false
    t.text     "description",           default: "", null: false
    t.float    "price",                              null: false
    t.integer  "catering_companies_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "inavailabilities", force: :cascade do |t|
    t.integer  "time_slot_id"
    t.integer  "catering_company_id"
    t.date     "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "tittle",              default: "", null: false
    t.text     "description",         default: "", null: false
    t.integer  "user_id"
    t.integer  "catering_company_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "time_slots", force: :cascade do |t|
    t.string   "tittle",     default: "", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "first_name",                        default: "", null: false
    t.string   "last_name",                         default: "", null: false
    t.string   "mobile_number1",         limit: 20, default: "", null: false
    t.string   "mobile_number2",         limit: 20, default: "", null: false
    t.date     "birthdate",                                      null: false
    t.string   "occupation",                        default: "", null: false
    t.string   "gender",                 limit: 10, default: "", null: false
    t.integer  "level",                             default: 3,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
