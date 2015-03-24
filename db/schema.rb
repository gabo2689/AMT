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

ActiveRecord::Schema.define(version: 20150324202356) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "phone"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dimentions", force: true do |t|
    t.string   "title"
    t.integer  "weight"
    t.integer  "priority_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dimentions", ["priority_id"], name: "index_dimentions_on_priority_id"

  create_table "factors", force: true do |t|
    t.string   "title"
    t.integer  "weight"
    t.integer  "dimention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "factors", ["dimention_id"], name: "index_factors_on_dimention_id"

  create_table "priorities", force: true do |t|
    t.string   "title"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "permission"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"

end
