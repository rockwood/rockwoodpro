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

ActiveRecord::Schema.define(version: 20130824001507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "password_resets", force: true do |t|
    t.string   "token"
    t.datetime "expiration"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pieces", force: true do |t|
    t.string   "title"
    t.string   "performer"
    t.string   "composer"
    t.integer  "track_number"
    t.integer  "year"
    t.string   "filetype"
    t.string   "filename"
    t.integer  "recording_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recordings", force: true do |t|
    t.integer  "state"
    t.string   "context"
    t.string   "level"
    t.string   "location"
    t.integer  "cds"
    t.integer  "dvds"
    t.datetime "datetime"
    t.string   "program_file"
    t.string   "directory"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recordings", ["state"], name: "index_recordings_on_state", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
