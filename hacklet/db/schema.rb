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

ActiveRecord::Schema.define(version: 20160516110553) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["event_id"], name: "index_attendances_on_event_id"
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id"

  create_table "blogit_comments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "website"
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blogit_comments", ["post_id"], name: "index_blogit_comments_on_post_id"

  create_table "blogit_posts", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "body",                             null: false
    t.string   "state",          default: "draft", null: false
    t.integer  "comments_count", default: 0,       null: false
    t.integer  "blogger_id"
    t.string   "blogger_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "blogit_posts", ["blogger_type", "blogger_id"], name: "index_blogit_posts_on_blogger_type_and_blogger_id"

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories_projects", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  add_index "categories_projects", ["category_id", "project_id"], name: "index_categories_projects_on_category_id_and_project_id"

  create_table "event_photos", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.boolean  "approved"
  end

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

  create_table "genders", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "given_items", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "given_items", ["item_id"], name: "index_given_items_on_item_id"
  add_index "given_items", ["user_id"], name: "index_given_items_on_user_id"

  create_table "invites", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invites", ["sender_id"], name: "index_invites_on_sender_id"

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.boolean  "solved"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "issues", ["event_id"], name: "index_issues_on_event_id"
  add_index "issues", ["user_id"], name: "index_issues_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mentors", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "mentors", ["event_id"], name: "index_mentors_on_event_id"
  add_index "mentors", ["user_id"], name: "index_mentors_on_user_id"

  create_table "participations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.integer "invite_id"
  end

  add_index "participations", ["invite_id"], name: "index_participations_on_invite_id"
  add_index "participations", ["team_id"], name: "index_participations_on_team_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

# Could not dump table "projects" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "projects_technologies", id: false, force: :cascade do |t|
    t.integer "technology_id"
    t.integer "project_id"
  end

  add_index "projects_technologies", ["technology_id", "project_id"], name: "index_projects_technologies_on_technology_id_and_project_id"

  create_table "recipients", force: :cascade do |t|
    t.string   "email"
    t.string   "token"
    t.boolean  "accepted"
    t.integer  "invite_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "site_url"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.integer  "captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["captain_id"], name: "index_teams_on_captain_id"
  add_index "teams", ["event_id"], name: "index_teams_on_event_id"

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

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
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "gender_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["gender_id"], name: "index_users_on_gender_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
