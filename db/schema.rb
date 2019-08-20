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

ActiveRecord::Schema.define(version: 2019_08_19_230936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "phone"
    t.string "address_receive"
    t.string "province"
    t.string "district"
    t.string "ward"
    t.boolean "default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.bigint "total_price"
    t.string "note"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_ship"
    t.index ["address_id"], name: "index_bills_on_address_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_ratings", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.integer "rating"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_comment_ratings_on_product_id"
    t.index ["user_id"], name: "index_comment_ratings_on_user_id"
  end

  create_table "delivers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "note"
    t.index ["bill_id"], name: "index_delivers_on_bill_id"
    t.index ["user_id"], name: "index_delivers_on_user_id"
  end

  create_table "image_slides", force: :cascade do |t|
    t.bigint "product_id"
    t.string "image"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_image_slides_on_product_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.integer "count", default: 1
    t.integer "price_per_item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "order_bills", force: :cascade do |t|
    t.bigint "bill_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_order_bills_on_bill_id"
    t.index ["order_id"], name: "index_order_bills_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "cart_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.bigint "price"
    t.string "thumbnail"
    t.string "description"
    t.integer "number_items"
    t.integer "count_view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "overview"
    t.integer "old_price"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_like", default: 0
    t.index ["product_id"], name: "index_questions_on_product_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "reply_comments", force: :cascade do |t|
    t.bigint "comment_rating_id"
    t.bigint "user_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_rating_id"], name: "index_reply_comments_on_comment_rating_id"
    t.index ["user_id"], name: "index_reply_comments_on_user_id"
  end

  create_table "reply_questions", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "user_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num_like", default: 0
    t.index ["question_id"], name: "index_reply_questions_on_question_id"
    t.index ["user_id"], name: "index_reply_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.integer "gender"
    t.string "job"
    t.date "birthday"
    t.string "avatar"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "last_cart"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bills", "addresses"
  add_foreign_key "bills", "users"
  add_foreign_key "comment_ratings", "products"
  add_foreign_key "comment_ratings", "users"
  add_foreign_key "delivers", "bills"
  add_foreign_key "delivers", "users"
  add_foreign_key "image_slides", "products"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
  add_foreign_key "order_bills", "bills"
  add_foreign_key "order_bills", "orders"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "questions", "products"
  add_foreign_key "questions", "users"
  add_foreign_key "reply_comments", "comment_ratings"
  add_foreign_key "reply_comments", "users"
  add_foreign_key "reply_questions", "questions"
  add_foreign_key "reply_questions", "users"
end
