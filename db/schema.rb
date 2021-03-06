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

ActiveRecord::Schema.define(version: 20170914205104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabins", force: :cascade do |t|
    t.integer "number", default: 0
    t.bigint "session_id"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_cabins_on_session_id"
  end

  create_table "campers", force: :cascade do |t|
    t.string "name"
    t.boolean "non_swimmer"
    t.boolean "has_food_allergies"
    t.boolean "has_medication"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "counselors", force: :cascade do |t|
    t.string "name"
    t.boolean "lifeguard", default: false
    t.boolean "wfa", default: false
    t.boolean "driver", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "days", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_days_on_session_id"
  end

  create_table "enf_classes", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "session_id"
    t.integer "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_enf_classes_on_session_id"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "loafs_of_bread", default: 0
    t.integer "pitas", default: 0
    t.integer "bagels", default: 0
    t.integer "tortillas", default: 0
    t.float "lbs_of_pasta", default: 0.0
    t.float "lbs_of_couscous", default: 0.0
    t.float "lbs_of_chips", default: 0.0
    t.float "lbs_of_sugar", default: 0.0
    t.float "lbs_of_flour", default: 0.0
    t.integer "onions", default: 0
    t.integer "garlic_heads", default: 0
    t.integer "peppers", default: 0
    t.integer "tomatoes", default: 0
    t.integer "carrots", default: 0
    t.integer "potatoes", default: 0
    t.integer "broccoli_heads", default: 0
    t.integer "avocados", default: 0
    t.text "other_vegetables"
    t.integer "apples", default: 0
    t.integer "oranges", default: 0
    t.integer "bananas", default: 0
    t.integer "peaches", default: 0
    t.float "lbs_jelly", default: 0.0
    t.integer "bags_of_crackers", default: 0
    t.float "lbs_gorp", default: 0.0
    t.text "other_fruits_or_snacks"
    t.float "lbs_hummus", default: 0.0
    t.float "lbs_veg_chili", default: 0.0
    t.float "lbs_deh_beans", default: 0.0
    t.float "lbs_peanut_butter", default: 0.0
    t.float "lbs_turkey", default: 0.0
    t.float "lbs_ham", default: 0.0
    t.float "lbs_cheese", default: 0.0
    t.float "lbs_falafel", default: 0.0
    t.float "lbs_tuna", default: 0.0
    t.text "other_proteins"
    t.float "lbs_grits", default: 0.0
    t.float "lbs_granola", default: 0.0
    t.float "lbs_oatmeal", default: 0.0
    t.float "lbs_grape_nuts", default: 0.0
    t.float "lbs_cream_wheat", default: 0.0
    t.float "lbs_hash_browns", default: 0.0
    t.text "other_breakfast_items"
    t.text "special_food_requests"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_foods_on_trip_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.bigint "session_counselor_id"
    t.bigint "enf_class_id"
    t.integer "days_attend", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enf_class_id"], name: "index_instructors_on_enf_class_id"
    t.index ["session_counselor_id"], name: "index_instructors_on_session_counselor_id"
  end

  create_table "session_campers", force: :cascade do |t|
    t.bigint "camper_id"
    t.bigint "cabin_id"
    t.bigint "session_id"
    t.integer "table_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabin_id"], name: "index_session_campers_on_cabin_id"
    t.index ["camper_id"], name: "index_session_campers_on_camper_id"
    t.index ["session_id"], name: "index_session_campers_on_session_id"
  end

  create_table "session_counselors", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "cabin_id"
    t.bigint "counselor_id"
    t.integer "table_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cabin_id"], name: "index_session_counselors_on_cabin_id"
    t.index ["counselor_id"], name: "index_session_counselors_on_counselor_id"
    t.index ["session_id"], name: "index_session_counselors_on_session_id"
  end

  create_table "session_vans", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "van_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_vans_on_session_id"
    t.index ["van_id"], name: "index_session_vans_on_van_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "number"
    t.date "start"
    t.date "finish"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "session_camper_id"
    t.bigint "enf_class_id"
    t.integer "days_attend", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enf_class_id"], name: "index_students_on_enf_class_id"
    t.index ["session_camper_id"], name: "index_students_on_session_camper_id"
  end

  create_table "trip_campers", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "session_camper_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_camper_id"], name: "index_trip_campers_on_session_camper_id"
    t.index ["trip_id"], name: "index_trip_campers_on_trip_id"
  end

  create_table "trip_counselors", force: :cascade do |t|
    t.bigint "session_counselor_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_counselor_id"], name: "index_trip_counselors_on_session_counselor_id"
    t.index ["trip_id"], name: "index_trip_counselors_on_trip_id"
  end

  create_table "trip_vans", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "session_van_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_van_id"], name: "index_trip_vans_on_session_van_id"
    t.index ["trip_id"], name: "index_trip_vans_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "description"
    t.text "destination"
    t.text "gear"
    t.boolean "requires_food", default: false
    t.boolean "requires_gear", default: false
    t.boolean "requires_van", default: false
    t.boolean "requires_lifeguard", default: false
    t.boolean "requires_wfa", default: false
    t.boolean "day_trip", default: false
    t.boolean "approved", default: false
    t.bigint "session_counselor_id"
    t.bigint "session_id"
    t.datetime "start"
    t.datetime "finish"
    t.integer "start_day_id"
    t.integer "end_day_id"
    t.string "trip_group_type"
    t.bigint "trip_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_counselor_id"], name: "index_trips_on_session_counselor_id"
    t.index ["session_id"], name: "index_trips_on_session_id"
    t.index ["trip_group_type", "trip_group_id"], name: "index_trips_on_trip_group_type_and_trip_group_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "counselor_id"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["counselor_id"], name: "index_users_on_counselor_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vans", force: :cascade do |t|
    t.integer "number"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
