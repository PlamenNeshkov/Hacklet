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

ActiveRecord::Schema.define(version: 20160401192146) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.datetime "start"
    t.datetime "end"
    t.integer  "max_participants"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "active"
  end

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "team_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["recipient_id"], name: "index_invites_on_recipient_id"
  add_index "invites", ["sender_id"], name: "index_invites_on_sender_id"

  create_table "participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.integer "invite_id"
  end

  add_index "participations", ["invite_id"], name: "index_participations_on_invite_id"
  add_index "participations", ["team_id"], name: "index_participations_on_team_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "repository_url"
    t.integer  "team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["captain_id"], name: "index_teams_on_captain_id"
  add_index "teams", ["event_id"], name: "index_teams_on_event_id"

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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role_id"
    t.string   "about_text"
    t.string   "site_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "avatar"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
