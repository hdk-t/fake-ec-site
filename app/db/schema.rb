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

ActiveRecord::Schema[7.0].define(version: 2023_07_07_235122) do
  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "item_price", null: false
    t.string "item_image_path", null: false
    t.text "item_sentence", null: false
    t.integer "item_maker_id", null: false, unsigned: true
    t.integer "item_category_id", null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mst_categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "category_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mst_makers", charset: "utf8mb3", force: :cascade do |t|
    t.string "maker_name", null: false
    t.text "maker_sentence", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mst_review_tags", charset: "utf8mb3", force: :cascade do |t|
    t.string "review_tag_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_tags", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.integer "review_id", null: false, unsigned: true
    t.integer "review_tag_id", null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", charset: "utf8mb3", force: :cascade do |t|
    t.integer "item_id", null: false, unsigned: true
    t.string "reviewer_name", null: false
    t.text "review_comment", null: false
    t.float "review_rating", default: 0.0, null: false, unsigned: true
    t.integer "price_rating", default: 0, null: false, unsigned: true
    t.integer "design_rating", default: 0, null: false, unsigned: true
    t.integer "quality_rating", default: 0, null: false, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
