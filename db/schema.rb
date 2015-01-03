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

ActiveRecord::Schema.define(version: 20150102042219) do

  create_table "jobs", force: :cascade do |t|
    t.string   "company",                    null: false
    t.string   "intro",                      null: false
    t.date     "from"
    t.date     "to"
    t.boolean  "always",     default: false
    t.string   "contact",                    null: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title"
    t.text     "content"
    t.string   "homepage"
  end

  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "alias_name",                                   null: false
    t.string   "homepage"
    t.string   "phone",                                        null: false
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "job_status",         limit: 1
    t.string   "job_status_etc"
    t.string   "dev_languages"
    t.string   "dev_duration"
    t.boolean  "dev_web",                      default: false
    t.boolean  "dev_system",                   default: false
    t.boolean  "dev_smart",                    default: false
    t.text     "dev_history"
    t.text     "community_activity"
    t.text     "book_author"
    t.text     "book_trans"
    t.boolean  "published",                    default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "profiles", ["alias_name"], name: "index_profiles_on_alias_name", unique: true
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workers", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workers", ["user_id"], name: "index_workers_on_user_id"

end
