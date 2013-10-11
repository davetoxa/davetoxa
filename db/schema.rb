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

ActiveRecord::Schema.define(version: 20130920204928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.string   "title",                            null: false
    t.text     "content",                          null: false
    t.string   "state",      default: "published", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "posts_tags", ["post_id"], name: "index_posts_tags_on_post_id", using: :btree
  add_index "posts_tags", ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id", unique: true, using: :btree
  add_index "posts_tags", ["tag_id"], name: "index_posts_tags_on_tag_id", using: :btree

  create_table "subscribes", force: true do |t|
    t.string   "email",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribes", ["email"], name: "index_subscribes_on_email", using: :btree

  create_table "tags", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",      null: false
    t.string   "username",   null: false
    t.string   "name"
    t.string   "info"
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "posts", "users", name: "posts_user_id_fk"

end
