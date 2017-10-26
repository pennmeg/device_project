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

ActiveRecord::Schema.define(version: 20171025215110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "airport_id"
    t.bigint "photo_id"
    t.string "plane_name"
    t.decimal "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_airplanes_on_airport_id"
    t.index ["photo_id"], name: "index_airplanes_on_photo_id"
    t.index ["user_id"], name: "index_airplanes_on_user_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "city_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "job_planes", force: :cascade do |t|
    t.bigint "airplane_id"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airplane_id"], name: "index_job_planes_on_airplane_id"
    t.index ["job_id"], name: "index_job_planes_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "client_name"
    t.string "client_email"
    t.string "description"
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.decimal "weight"
    t.decimal "cost"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["destination_id"], name: "index_jobs_on_destination_id"
    t.index ["origin_id"], name: "index_jobs_on_origin_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "caption"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "airplanes", "airports"
  add_foreign_key "airplanes", "photos"
  add_foreign_key "airplanes", "users"
  add_foreign_key "job_planes", "airplanes"
  add_foreign_key "job_planes", "jobs"
end
