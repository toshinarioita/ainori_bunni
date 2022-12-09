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

ActiveRecord::Schema.define(version: 2021_09_24_133702) do

  create_table "chat_messages", force: :cascade do |t|
    t.text "message"
    t.integer "user_id"
    t.integer "recruitment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "anounce", default: false, null: false
    t.index ["recruitment_id"], name: "index_chat_messages_on_recruitment_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.datetime "datetime"
    t.integer "participants"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_recruitments", force: :cascade do |t|
    t.integer "recruitment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recruitment_id"], name: "index_user_recruitments_on_recruitment_id"
    t.index ["user_id"], name: "index_user_recruitments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "is_deleted"
    t.string "boolean"
    t.boolean "admin", default: false
    t.text "profile"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_messages", "recruitments"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "user_recruitments", "recruitments"
  add_foreign_key "user_recruitments", "users"
end
