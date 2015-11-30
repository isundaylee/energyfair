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

ActiveRecord::Schema.define(version: 20151129232058) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "logo_permission"
    t.integer  "level"
    t.string   "gigawatt_option"
    t.string   "street_address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "telephone"
    t.integer  "attendances"
    t.text     "attendee_names"
    t.text     "attendee_emails"
    t.text     "attendee_telephones"
    t.boolean  "additional_needed"
    t.text     "additional"
    t.text     "items"
    t.string   "networking_event"
    t.text     "comment"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "university"
    t.string   "degree"
    t.string   "major"
    t.text     "interests"
    t.integer  "graduation_month"
    t.integer  "graduation_year"
    t.string   "citizenship"
    t.text     "top_companies"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

end
