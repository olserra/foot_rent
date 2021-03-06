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

ActiveRecord::Schema.define(version: 2019_02_28_124330) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "club_id"
    t.bigint "player_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_bookings_on_club_id"
    t.index ["player_id"], name: "index_bookings_on_player_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_clubs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "value_per_match"
    t.string "nationality"
    t.string "social_url"
    t.integer "age"
    t.boolean "availability"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["club_id"], name: "index_players_on_club_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.integer "stars"
    t.bigint "player_id"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_reviews_on_club_id"
    t.index ["player_id"], name: "index_reviews_on_player_id"
  end

  create_table "stats", force: :cascade do |t|
    t.integer "goals"
    t.integer "assists"
    t.bigint "player_id"
    t.integer "games_played"
    t.string "form"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_stats_on_player_id"
  end

  add_foreign_key "bookings", "clubs"
  add_foreign_key "bookings", "players"
  add_foreign_key "players", "clubs"
  add_foreign_key "reviews", "clubs"
  add_foreign_key "reviews", "players"
  add_foreign_key "stats", "players"
end
