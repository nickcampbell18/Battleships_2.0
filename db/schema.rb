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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111025184211) do

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "uuid"
    t.boolean  "started",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "text"
    t.integer  "priority",   :default => 0
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.string   "uuid"
    t.integer  "game_id"
    t.text     "fired_and_missed_shots",    :default => "[]"
    t.text     "fired_and_hit_shots",       :default => "[]"
    t.text     "occupied_and_missed_cells", :default => "[]"
    t.text     "occupied_and_lost_cells",   :default => "[]"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ships", :force => true do |t|
    t.string   "h"
    t.string   "v"
    t.integer  "l"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
