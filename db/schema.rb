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

ActiveRecord::Schema.define(version: 20140108113555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "content",                          null: false
    t.string   "state",      default: "published", null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
    t.index ["post_id"], name: "index_posts_tags_on_post_id"
    t.index ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id", unique: true
    t.index ["tag_id"], name: "index_posts_tags_on_tag_id"
  end

  create_table "subscribes", force: :cascade do |t|
    t.string   "email",                     null: false
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_subscribes_on_email"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      null: false
    t.string   "username",   null: false
    t.string   "name"
    t.string   "info"
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
