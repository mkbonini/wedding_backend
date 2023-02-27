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

ActiveRecord::Schema.define(version: 2023_02_27_180139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "rsvp"
    t.string "diet"
    t.integer "payment_method"
    t.integer "arrival_date"
    t.integer "party_count"
    t.integer "plus_one_count"
    t.string "comments"
    t.bigint "lodging_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bed_count"
    t.integer "breakfast"
    t.integer "has_kids"
    t.index ["lodging_id"], name: "index_guests_on_lodging_id"
    t.index ["team_id"], name: "index_guests_on_team_id"
  end

  create_table "kids", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lodging_id"
    t.bigint "team_id"
    t.integer "needs_bed"
    t.integer "child_care"
    t.index ["guest_id"], name: "index_kids_on_guest_id"
    t.index ["lodging_id"], name: "index_kids_on_lodging_id"
    t.index ["team_id"], name: "index_kids_on_team_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string "name"
    t.integer "lodging_type"
    t.integer "capacity"
    t.string "url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "image_url"
    t.string "color"
    t.string "map_url"
  end

  create_table "plus_ones", force: :cascade do |t|
    t.string "name"
    t.bigint "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lodging_id"
    t.bigint "team_id"
    t.index ["guest_id"], name: "index_plus_ones_on_guest_id"
    t.index ["lodging_id"], name: "index_plus_ones_on_lodging_id"
    t.index ["team_id"], name: "index_plus_ones_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "guests", "lodgings"
  add_foreign_key "guests", "teams"
  add_foreign_key "kids", "guests"
  add_foreign_key "kids", "lodgings"
  add_foreign_key "kids", "teams"
  add_foreign_key "plus_ones", "guests"
  add_foreign_key "plus_ones", "lodgings"
  add_foreign_key "plus_ones", "teams"
end
