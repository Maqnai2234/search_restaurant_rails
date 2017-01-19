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

ActiveRecord::Schema.define(version: 20170119164002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_restaurants", id: false, force: :cascade do |t|
    t.integer "city_id",       null: false
    t.integer "restaurant_id", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_phones_on_zone_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.integer  "stars"
    t.string   "image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "specialty_id"
    t.index ["specialty_id"], name: "index_restaurants_on_specialty_id", using: :btree
  end

  create_table "specialties", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string   "address"
    t.string   "schedule"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "restaurant_id"
    t.integer  "city_id"
    t.index ["city_id"], name: "index_zones_on_city_id", using: :btree
    t.index ["restaurant_id"], name: "index_zones_on_restaurant_id", using: :btree
  end

  add_foreign_key "phones", "zones"
  add_foreign_key "restaurants", "specialties"
  add_foreign_key "zones", "cities"
  add_foreign_key "zones", "restaurants"
end
