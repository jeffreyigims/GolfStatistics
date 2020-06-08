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

ActiveRecord::Schema.define(version: 2020_06_08_175222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "pga_course_id"
    t.string "course_code"
    t.string "course_name"
    t.integer "par_in"
    t.integer "par_out"
    t.integer "par_total"
    t.integer "distance_in"
    t.integer "distance_out"
    t.integer "distance_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_holes", force: :cascade do |t|
    t.integer "hole_num"
    t.integer "cNum"
    t.integer "shots_taken"
    t.integer "par_day"
    t.integer "par_total"
    t.integer "round_hole_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_holes_on_player_id"
    t.index ["round_hole_id"], name: "index_player_holes_on_round_hole_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "pga_player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_holes", force: :cascade do |t|
    t.integer "pga_hole_id"
    t.integer "par"
    t.integer "distance"
    t.integer "stimp"
    t.integer "round_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["round_id"], name: "index_round_holes_on_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "course_id"
    t.integer "round_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_rounds_on_course_id"
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
  end

  create_table "shots", force: :cascade do |t|
    t.integer "shot_num"
    t.datetime "time"
    t.string "t"
    t.string "prv"
    t.string "tee"
    t.string "cup"
    t.string "from"
    t.string "to"
    t.string "asc"
    t.integer "dist"
    t.integer "left"
    t.integer "x"
    t.integer "y"
    t.integer "z"
    t.string "club"
    t.string "con"
    t.string "shot_text"
    t.integer "player_hole_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_hole_id"], name: "index_shots_on_player_hole_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "tour_code"
    t.string "tour_name"
    t.string "pga_tournament_id"
    t.string "tournament_name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
