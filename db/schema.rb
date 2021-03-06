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

ActiveRecord::Schema.define(version: 20150830225048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pieces", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "performer",    limit: 255
    t.string   "composer",     limit: 255
    t.integer  "track_number"
    t.integer  "year"
    t.string   "filetype",     limit: 255
    t.string   "filename",     limit: 255
    t.integer  "recording_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "shared",                   default: false
  end

  create_table "recordings", force: :cascade do |t|
    t.string   "state",        limit: 255
    t.string   "context",      limit: 255
    t.string   "level",        limit: 255
    t.string   "location",     limit: 255
    t.integer  "cds"
    t.integer  "dvds"
    t.datetime "datetime"
    t.string   "program_file", limit: 255
    t.string   "directory",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "demo",                     default: false
    t.string   "embed_code",   limit: 255
    t.boolean  "live_stream"
    t.integer  "change_count",             default: 1
    t.float    "duration",                 default: 1.0
  end

  add_index "recordings", ["state"], name: "index_recordings_on_state", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                limit: 255
    t.string   "last_name",                 limit: 255
    t.string   "email",                     limit: 255
    t.string   "password_digest",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "password_reset_token",      limit: 255
    t.datetime "password_reset_expiration"
    t.boolean  "legacy",                                default: false
  end

end
