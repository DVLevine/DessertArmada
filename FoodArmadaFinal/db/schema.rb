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

ActiveRecord::Schema.define(version: 20141205065810) do

  create_table "food_mappings", force: true do |t|
    t.float    "biotin",      limit: 24
    t.float    "choline",     limit: 24
    t.float    "folate",      limit: 24
    t.float    "folic_acid",  limit: 24
    t.float    "niacin",      limit: 24
    t.float    "riboflavin",  limit: 24
    t.float    "thiamin",     limit: 24
    t.float    "vitamin_A",   limit: 24
    t.float    "vitamin_B12", limit: 24
    t.float    "vitamin_B6",  limit: 24
    t.float    "vitamin_C",   limit: 24
    t.float    "vitamin_D",   limit: 24
    t.float    "vitamin_E",   limit: 24
    t.float    "vitamin_K",   limit: 24
    t.float    "panto_acid",  limit: 24
    t.integer  "calories"
    t.integer  "fatCalories"
    t.float    "fiber",       limit: 24
    t.float    "protein",     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: true do |t|
    t.integer  "user_id"
    t.string   "image"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.integer  "crop_w"
    t.integer  "crop_h"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meals", ["user_id"], name: "index_meals_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.float    "bmr",                    limit: 24
    t.integer  "gender"
    t.float    "height",                 limit: 24
    t.float    "weight",                 limit: 24
  end

end
