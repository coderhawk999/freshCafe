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

ActiveRecord::Schema.define(version: 2021_04_04_133850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foodcarts", force: :cascade do |t|
    t.string "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foodcarts_items", force: :cascade do |t|
    t.bigint "quantity"
    t.bigint "menu_categories_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "foodcart_id"
  end

  create_table "menu_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_categories_items", force: :cascade do |t|
    t.string "name"
    t.bigint "price"
    t.text "description"
    t.boolean "is_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "menu_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "completed"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "totalPrice"
    t.boolean "is_walkin"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "orders_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "menu_categories_item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "quantity"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin"
    t.boolean "is_clirk"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "orders", "users"
end
