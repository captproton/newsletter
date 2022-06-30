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

ActiveRecord::Schema[7.0].define(version: 2022_06_30_170343) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletter_area_elements", force: :cascade do |t|
    t.bigint "newsletter_area_id", null: false
    t.bigint "newsletter_element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_area_id"], name: "index_newsletter_area_elements_on_newsletter_area_id"
    t.index ["newsletter_element_id"], name: "index_newsletter_area_elements_on_newsletter_element_id"
  end

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

  create_table "newsletter_assets", force: :cascade do |t|
    t.bigint "newsletter_field_id", null: false
    t.bigint "newsletter_piece_id", null: false
    t.string "image"
    t.string "content_type"
    t.integer "size"
    t.integer "width"
    t.integer "parent_id"
    t.string "thumbnail"
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_field_id"], name: "index_newsletter_assets_on_newsletter_field_id"
    t.index ["newsletter_piece_id"], name: "index_newsletter_assets_on_newsletter_piece_id"
  end

  create_table "newsletter_designs", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.text "html_design"
    t.integer "updated_by_id"
    t.text "stylesheet_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
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

  create_table "newsletter_field_values", force: :cascade do |t|
    t.bigint "newsletter_piece_id", null: false
    t.bigint "newsletter_field_id", null: false
    t.string "key", null: false
    t.text "value", null: false
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_field_id"], name: "index_newsletter_field_values_on_newsletter_field_id"
    t.index ["newsletter_piece_id"], name: "index_newsletter_field_values_on_newsletter_piece_id"
  end

  create_table "newsletter_fields", force: :cascade do |t|
    t.string "name"
    t.bigint "newsletter_element_id", null: false
    t.string "label"
    t.integer "sequence"
    t.boolean "is_required"
    t.string "description"
    t.string "type"
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_element_id"], name: "index_newsletter_fields_on_newsletter_element_id"
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

  create_table "newsletter_pieces", force: :cascade do |t|
    t.bigint "newsletter_newsletter_id", null: false
    t.bigint "newsletter_area_id", null: false
    t.bigint "newsletter_element_id", null: false
    t.integer "sequence", null: false
    t.integer "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_area_id"], name: "index_newsletter_pieces_on_newsletter_area_id"
    t.index ["newsletter_element_id"], name: "index_newsletter_pieces_on_newsletter_element_id"
    t.index ["newsletter_newsletter_id"], name: "index_newsletter_pieces_on_newsletter_newsletter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "newsletter_area_elements", "newsletter_areas"
  add_foreign_key "newsletter_area_elements", "newsletter_elements"
  add_foreign_key "newsletter_areas", "newsletter_designs", column: "newsletter_designs_id"
  add_foreign_key "newsletter_assets", "newsletter_fields"
  add_foreign_key "newsletter_assets", "newsletter_pieces"
  add_foreign_key "newsletter_elements", "newsletter_designs", column: "newsletter_designs_id"
  add_foreign_key "newsletter_field_values", "newsletter_fields"
  add_foreign_key "newsletter_field_values", "newsletter_pieces"
  add_foreign_key "newsletter_fields", "newsletter_elements"
  add_foreign_key "newsletter_newsletters", "newsletter_designs", column: "newsletter_designs_id"
  add_foreign_key "newsletter_pieces", "newsletter_areas"
  add_foreign_key "newsletter_pieces", "newsletter_elements"
  add_foreign_key "newsletter_pieces", "newsletter_newsletters"
end
