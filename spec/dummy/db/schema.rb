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

ActiveRecord::Schema[7.0].define(version: 2022_06_25_171232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletter_areas", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "newsletter_designs_id", null: false
    t.integer "updated_by"
    t.datetime "delelted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_designs_id"], name: "index_newsletter_areas_on_newsletter_designs_id"
  end

  create_table "newsletter_designs", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.text "html_design"
    t.integer "updated_by"
    t.text "stysheet_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletter_elements", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.text "html_design"
    t.bigint "newsletter_designs_id", null: false
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_designs_id"], name: "index_newsletter_elements_on_newsletter_designs_id"
  end

  create_table "newsletter_newsletters", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.bigint "newsletter_designs_id", null: false
    t.integer "sequence"
    t.datetime "published_at"
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_designs_id"], name: "index_newsletter_newsletters_on_newsletter_designs_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "newsletter_areas", "newsletter_designs", column: "newsletter_designs_id"
  add_foreign_key "newsletter_elements", "newsletter_designs", column: "newsletter_designs_id"
  add_foreign_key "newsletter_newsletters", "newsletter_designs", column: "newsletter_designs_id"
end
