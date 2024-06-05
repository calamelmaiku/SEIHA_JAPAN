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

ActiveRecord::Schema[7.0].define(version: 2024_06_03_021630) do
  create_table "groups", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "creator"
    t.text "text"
  end

  create_table "spots", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "text"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_spots_on_group_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visiteds", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.boolean "visited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_visiteds_on_spot_id"
    t.index ["user_id"], name: "index_visiteds_on_user_id"
  end

  add_foreign_key "visiteds", "spots"
  add_foreign_key "visiteds", "users"
end
