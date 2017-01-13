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

ActiveRecord::Schema.define(version: 20170113183339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users_wines", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "wine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_wines", ["user_id"], name: "index_users_wines_on_user_id", using: :btree
  add_index "users_wines", ["wine_id"], name: "index_users_wines_on_wine_id", using: :btree

  create_table "wines", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.text     "description"
    t.float    "alcohol_by_volume"
    t.string   "ttb_label"
    t.string   "slug"
    t.text     "oak"
    t.text     "soil"
    t.integer  "min_serve_temperature"
    t.integer  "max_serve_temperature"
    t.text     "fun_facts"
    t.text     "aromas"
    t.text     "taste"
    t.integer  "fruit"
    t.integer  "earth"
    t.integer  "body"
    t.integer  "acid"
    t.integer  "tannins"
    t.integer  "alcohol"
    t.integer  "sweetness"
    t.text     "classic_pairings"
    t.string   "label_image"
    t.string   "bottle_image"
    t.integer  "vineyard_id"
    t.text     "appearance"
    t.integer  "appearance_focus"
    t.text     "appellation_region_state"
    t.text     "farming"
    t.text     "lifestyle_image"
    t.text     "profile"
    t.text     "tasting_tip"
    t.text     "appearance_description"
    t.text     "tasting_card"
    t.text     "status"
    t.text     "region_description"
    t.integer  "public_id"
    t.text     "ds_lifestyle_image"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "vineyard"
    t.string   "region"
  end

  add_foreign_key "users_wines", "users"
  add_foreign_key "users_wines", "wines"
end
