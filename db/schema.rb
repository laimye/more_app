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

ActiveRecord::Schema.define(version: 20170119011753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "announcements", ["trip_id"], name: "index_announcements_on_trip_id", using: :btree
  add_index "announcements", ["user_id"], name: "index_announcements_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "invites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invites", ["trip_id"], name: "index_invites_on_trip_id", using: :btree
  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.integer  "trip_id"
  end

  add_index "posts", ["trip_id"], name: "index_posts_on_trip_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "place"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "about"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "about"
    t.string   "fact"
    t.text     "places"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "password_digest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "announcements", "trips"
  add_foreign_key "announcements", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "invites", "trips"
  add_foreign_key "invites", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "posts", "trips"
  add_foreign_key "posts", "users"
  add_foreign_key "trips", "users"
end
