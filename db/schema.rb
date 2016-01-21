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

ActiveRecord::Schema.define(version: 20160121001306) do

  create_table "additional_infos", force: :cascade do |t|
    t.string   "key",               limit: 40,    null: false
    t.text     "value",             limit: 65535
    t.integer  "remote_client_id",  limit: 4
    t.integer  "social_session_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "additional_infos", ["remote_client_id"], name: "index_additional_infos_on_remote_client_id", using: :btree
  add_index "additional_infos", ["social_session_id"], name: "index_additional_infos_on_social_session_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "partnerships",             limit: 140
    t.string   "revenue_model",            limit: 255,                                        null: false
    t.string   "value_proposition",        limit: 140
    t.string   "advantages",               limit: 255,                                        null: false
    t.string   "disadvantages",            limit: 255,                                        null: false
    t.string   "costumer_success_stories", limit: 255
    t.decimal  "main_product_price",                   precision: 7, scale: 2, default: 0.0,  null: false
    t.boolean  "active",                                                       default: true, null: false
    t.integer  "pitch_id",                 limit: 4
    t.integer  "start_up_id",              limit: 4
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
  end

  add_index "businesses", ["pitch_id"], name: "index_businesses_on_pitch_id", using: :btree
  add_index "businesses", ["start_up_id"], name: "index_businesses_on_start_up_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.string   "link",          limit: 55,                null: false
    t.integer  "active_type",   limit: 4,     default: 1, null: false
    t.text     "body",          limit: 65535
    t.text     "visible_attrs", limit: 65535
    t.integer  "pitch_id",      limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "campaigns", ["pitch_id"], name: "index_campaigns_on_pitch_id", using: :btree

  create_table "competitors", force: :cascade do |t|
    t.string   "name",            limit: 55,                                          null: false
    t.decimal  "price",                       precision: 8,  scale: 2
    t.decimal  "total_revenue",               precision: 15, scale: 2
    t.integer  "total_costumers", limit: 4
    t.string   "success_stories", limit: 140
    t.string   "bad_stories",     limit: 140
    t.string   "your_advantage",  limit: 255
    t.boolean  "active",                                               default: true, null: false
    t.integer  "pitch_id",        limit: 4
    t.integer  "start_up_id",     limit: 4
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  add_index "competitors", ["pitch_id"], name: "index_competitors_on_pitch_id", using: :btree
  add_index "competitors", ["start_up_id"], name: "index_competitors_on_start_up_id", using: :btree

  create_table "financials", force: :cascade do |t|
    t.integer  "total_users",        limit: 4,                                         null: false
    t.integer  "total_costumers",    limit: 4
    t.decimal  "total_revenue",                precision: 12, scale: 2
    t.decimal  "total_expense",                precision: 10, scale: 2
    t.decimal  "bootstrapped",                 precision: 10, scale: 2,                null: false
    t.integer  "market_penetration", limit: 4
    t.boolean  "active",                                                default: true, null: false
    t.integer  "pitch_id",           limit: 4
    t.integer  "start_up_id",        limit: 4
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "financials", ["pitch_id"], name: "index_financials_on_pitch_id", using: :btree
  add_index "financials", ["start_up_id"], name: "index_financials_on_start_up_id", using: :btree

  create_table "ideas", force: :cascade do |t|
    t.string   "main_problem",       limit: 75,                 null: false
    t.string   "second_problems",    limit: 255
    t.string   "current_solution",   limit: 140
    t.string   "tag_line_pitch",     limit: 75
    t.string   "high_concept_pitch", limit: 50
    t.string   "how_validate",       limit: 140
    t.boolean  "active",                         default: true, null: false
    t.integer  "pitch_id",           limit: 4
    t.integer  "start_up_id",        limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "ideas", ["pitch_id"], name: "index_ideas_on_pitch_id", using: :btree
  add_index "ideas", ["start_up_id"], name: "index_ideas_on_start_up_id", using: :btree

  create_table "investments", force: :cascade do |t|
    t.integer  "general_terms",       limit: 4,                                        null: false
    t.integer  "raising_time",        limit: 4
    t.decimal  "founder_salaries",              precision: 7, scale: 2, default: 0.0,  null: false
    t.decimal  "costumer_conversion",           precision: 5, scale: 2, default: 0.0,  null: false
    t.decimal  "product_development",           precision: 7, scale: 2, default: 0.0,  null: false
    t.decimal  "equipments",                    precision: 5, scale: 2, default: 0.0,  null: false
    t.boolean  "active",                                                default: true, null: false
    t.integer  "start_up_id",         limit: 4
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "investments", ["start_up_id"], name: "index_investments_on_start_up_id", using: :btree

  create_table "markets", force: :cascade do |t|
    t.string   "segment",                limit: 75,                 null: false
    t.integer  "currency_iso",           limit: 4,   default: 986,  null: false
    t.integer  "total_money",            limit: 8
    t.integer  "total_costumers",        limit: 8
    t.string   "trends_insight",         limit: 140
    t.string   "costumer_specification", limit: 140
    t.boolean  "active",                             default: true, null: false
    t.integer  "pitch_id",               limit: 4
    t.integer  "start_up_id",            limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "markets", ["pitch_id"], name: "index_markets_on_pitch_id", using: :btree
  add_index "markets", ["start_up_id"], name: "index_markets_on_start_up_id", using: :btree

  create_table "pitches", force: :cascade do |t|
    t.string   "name",                limit: 55,  null: false
    t.datetime "cover_updated_at"
    t.integer  "cover_file_size",     limit: 4
    t.string   "cover_content_type",  limit: 255
    t.string   "cover_file_name",     limit: 255
    t.datetime "avatar_updated_at"
    t.integer  "avatar_file_size",    limit: 4
    t.string   "avatar_content_type", limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.string   "video_link",          limit: 255
    t.integer  "user_id",             limit: 4,   null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "pitches", ["user_id"], name: "index_pitches_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "stage",               limit: 4,                   null: false
    t.datetime "avatar_updated_at"
    t.integer  "avatar_file_size",    limit: 4
    t.string   "avatar_content_type", limit: 255
    t.string   "avatar_file_name",    limit: 255
    t.boolean  "awards",                          default: false, null: false
    t.boolean  "patent",                          default: false, null: false
    t.boolean  "active",                          default: true,  null: false
    t.integer  "pitch_id",            limit: 4
    t.integer  "start_up_id",         limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "projects", ["pitch_id"], name: "index_projects_on_pitch_id", using: :btree
  add_index "projects", ["start_up_id"], name: "index_projects_on_start_up_id", using: :btree

  create_table "providers", force: :cascade do |t|
    t.string   "name",        limit: 75,  null: false
    t.string   "segment",     limit: 75,  null: false
    t.string   "provides",    limit: 255, null: false
    t.string   "counterpart", limit: 255
    t.integer  "pitch_id",    limit: 4
    t.integer  "start_up_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "providers", ["pitch_id"], name: "index_providers_on_pitch_id", using: :btree
  add_index "providers", ["start_up_id"], name: "index_providers_on_start_up_id", using: :btree

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

  create_table "start_ups", force: :cascade do |t|
    t.integer  "nitro_equity",       limit: 4,   null: false
    t.string   "name",               limit: 45,  null: false
    t.datetime "brand_updated_at"
    t.integer  "brand_file_size",    limit: 4
    t.string   "brand_content_type", limit: 255
    t.string   "brand_file_name",    limit: 255
    t.integer  "pitch_id",           limit: 4,   null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "start_ups", ["pitch_id"], name: "index_start_ups_on_pitch_id", using: :btree

  create_table "supporters", force: :cascade do |t|
    t.integer  "role",              limit: 4,                            default: 1, null: false
    t.decimal  "how_much_pays",                 precision: 15, scale: 2
    t.boolean  "pay_the_expected",                                                   null: false
    t.string   "positive_feedback", limit: 255
    t.string   "negative_feedback", limit: 255
    t.integer  "pitch_id",          limit: 4
    t.integer  "start_up_id",       limit: 4
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  add_index "supporters", ["pitch_id"], name: "index_supporters_on_pitch_id", using: :btree
  add_index "supporters", ["start_up_id"], name: "index_supporters_on_start_up_id", using: :btree

  create_table "teammates", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.string   "expertise",  limit: 255
    t.boolean  "contacts"
    t.integer  "team_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teammates", ["team_id"], name: "index_teammates_on_team_id", using: :btree
  add_index "teammates", ["user_id"], name: "index_teammates_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "pitch_id",    limit: 4
    t.integer  "start_up_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "teams", ["pitch_id"], name: "index_teams_on_pitch_id", using: :btree
  add_index "teams", ["start_up_id"], name: "index_teams_on_start_up_id", using: :btree

  create_table "tractions", force: :cascade do |t|
    t.string   "grow_strategy",     limit: 140,                                        null: false
    t.decimal  "lead_cust",                     precision: 5, scale: 2
    t.decimal  "conversion_cust",               precision: 5, scale: 2
    t.integer  "amount_daily_lead", limit: 4
    t.integer  "daily_growth_rate", limit: 4
    t.string   "costumer_channels", limit: 140,                                        null: false
    t.boolean  "active",                                                default: true, null: false
    t.integer  "pitch_id",          limit: 4
    t.integer  "start_up_id",       limit: 4
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
  end

  add_index "tractions", ["pitch_id"], name: "index_tractions_on_pitch_id", using: :btree
  add_index "tractions", ["start_up_id"], name: "index_tractions_on_start_up_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 50,               null: false
    t.integer  "role",                   limit: 4,   default: 2,  null: false
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
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "invited_by_id",          limit: 4
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "businesses", "pitches"
  add_foreign_key "businesses", "start_ups"
  add_foreign_key "campaigns", "pitches"
  add_foreign_key "competitors", "pitches"
  add_foreign_key "competitors", "start_ups"
  add_foreign_key "financials", "pitches"
  add_foreign_key "financials", "start_ups"
  add_foreign_key "ideas", "pitches"
  add_foreign_key "ideas", "start_ups"
  add_foreign_key "investments", "start_ups"
  add_foreign_key "markets", "pitches"
  add_foreign_key "markets", "start_ups"
  add_foreign_key "pitches", "users"
  add_foreign_key "projects", "pitches"
  add_foreign_key "projects", "start_ups"
  add_foreign_key "providers", "pitches"
  add_foreign_key "providers", "start_ups"
  add_foreign_key "social_sessions", "users"
  add_foreign_key "start_ups", "pitches"
  add_foreign_key "supporters", "pitches"
  add_foreign_key "supporters", "start_ups"
  add_foreign_key "teammates", "teams"
  add_foreign_key "teammates", "users"
  add_foreign_key "teams", "pitches"
  add_foreign_key "teams", "start_ups"
  add_foreign_key "tractions", "pitches"
  add_foreign_key "tractions", "start_ups"
end
