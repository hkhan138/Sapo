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

ActiveRecord::Schema.define(version: 20140112143451) do

  create_table "games", force: true do |t|
    t.string   "game_name"
    t.integer  "score_limit"
    t.integer  "number_of_players"
    t.integer  "winner_team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_turn"
    t.integer  "team_turn"
  end

  create_table "players", force: true do |t|
    t.string   "player_name"
    t.integer  "score"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "previous_throw"
  end

  create_table "teams", force: true do |t|
    t.string   "team_name"
    t.integer  "total_score"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
