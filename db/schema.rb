# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_15_205838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "congresses", force: :cascade do |t|
    t.integer "size"
    t.integer "number_of_states"
    t.boolean "include_senate"
    t.boolean "include_campaigns"
    t.boolean "include_money"
    t.boolean "include_committees"
    t.boolean "is_private"
    t.boolean "includes_leadership"
    t.integer "country_direction"
    t.integer "weeks_per_session"
    t.string "length_of_week"
    t.integer "bill_limit"
    t.integer "contribution_limit"
    t.boolean "interest_groups"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_congresses_on_owner_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "congress_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["congress_id"], name: "index_memberships_on_congress_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "politicians", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "party"
    t.string "profession"
    t.string "avatar"
    t.boolean "is_currently_candidate"
    t.boolean "is_incumbent"
    t.integer "current_coh"
    t.integer "charisma"
    t.integer "intelligence"
    t.integer "work_ethic"
    t.integer "moral_compass"
    t.integer "network"
    t.bigint "user_id", null: false
    t.bigint "congress_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "membership_id"
    t.index ["congress_id"], name: "index_politicians_on_congress_id"
    t.index ["membership_id"], name: "index_politicians_on_membership_id"
    t.index ["user_id"], name: "index_politicians_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "congresses", "users", column: "owner_id"
  add_foreign_key "memberships", "congresses"
  add_foreign_key "memberships", "users"
  add_foreign_key "politicians", "congresses"
  add_foreign_key "politicians", "memberships"
  add_foreign_key "politicians", "users"
end
