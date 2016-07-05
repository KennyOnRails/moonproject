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

ActiveRecord::Schema.define(version: 20160704081306) do

  create_table "notify_methods", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer  "project_id"
    t.date     "deadline"
    t.string   "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "aasm_state",  default: "ready"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "target"
    t.string   "subtarget"
    t.string   "success_define"
    t.string   "possible"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "progresses_count", default: 0
    t.integer  "confirm_count",    default: 0
  end

  create_table "real_lives", force: :cascade do |t|
    t.string   "schedule_type"
    t.string   "description"
    t.string   "notify_flag"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "project_id"
    t.integer  "schedule_num"
  end

end
