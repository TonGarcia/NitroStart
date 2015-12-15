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

ActiveRecord::Schema.define(version: 20151215150716) do

  create_table "additional_infos", force: :cascade do |t|
    t.string   "key",               limit: 40,    null: false
    t.text     "value",             limit: 65535
    t.integer  "social_session_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "additional_infos", ["social_session_id"], name: "index_additional_infos_on_social_session_id", using: :btree

  create_table "social_sessions", force: :cascade do |t|
    t.string   "uid",            limit: 65,  null: false
    t.string   "name",           limit: 60,  null: false
    t.string   "email",          limit: 60
    t.string   "username",       limit: 60
    t.string   "picture",        limit: 150
    t.string   "token",          limit: 255, null: false
    t.string   "provider",       limit: 50,  null: false
    t.integer  "social_network", limit: 4,   null: false
    t.string   "secret",         limit: 255
    t.datetime "expires_at"
    t.integer  "user_id",        limit: 4,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "social_sessions", ["user_id"], name: "index_social_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 50,               null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "legal_id",               limit: 45
    t.string   "locale",                 limit: 5
    t.string   "zip_code",               limit: 30
    t.string   "address_name",           limit: 80
    t.integer  "address_number",         limit: 4
    t.string   "address_complement",     limit: 50
    t.integer  "timezone",               limit: 4
    t.string   "gender",                 limit: 1
    t.string   "invite_key",             limit: 255
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "invited_by_id",          limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "social_sessions", "users"
end
