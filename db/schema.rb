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

ActiveRecord::Schema.define(version: 20161226010900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "course_name"
    t.string   "course_year"
    t.string   "course_semester"
    t.string   "description"
    t.string   "name"
    t.string   "filename"
    t.string   "original_filename"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "includes_answers",  default: false
    t.string   "content_type"
  end

  add_index "assignments", ["school_id"], name: "index_assignments_on_school_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.integer  "school_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["school_id"], name: "index_courses_on_school_id", using: :btree

  create_table "downloads", force: :cascade do |t|
    t.integer  "assignment_id"
    t.string   "stripe_email"
    t.string   "stripe_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "downloads", ["assignment_id"], name: "index_downloads_on_assignment_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "ipeds_id"
    t.string   "city"
    t.string   "state"
    t.string   "description"
    t.string   "school_type"
    t.string   "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
