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

ActiveRecord::Schema[8.0].define(version: 2024_12_08_194354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "class_groups", force: :cascade do |t|
    t.integer "number"
    t.string "letter"
    t.integer "students_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "school_id", null: false
    t.index ["school_id"], name: "index_class_groups_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.string "class_id"
    t.string "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_group_id", null: false
    t.index ["class_group_id"], name: "index_students_on_class_group_id"
  end

  add_foreign_key "class_groups", "schools"
  add_foreign_key "students", "class_groups"
end
