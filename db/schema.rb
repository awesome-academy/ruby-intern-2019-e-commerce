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

ActiveRecord::Schema.define(version: 2019_08_09_022459) do

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

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
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
    t.bigint "transaction_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transaction_id"], name: "index_delivers_on_transaction_id"
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

  create_table "order_transactions", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_transactions_on_order_id"
    t.index ["transaction_id"], name: "index_order_transactions_on_transaction_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "product_id"
    t.integer "count"
    t.bigint "price_per_item"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
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
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "user_id"
    t.string "content"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["question_id"], name: "index_reply_questions_on_question_id"
    t.index ["user_id"], name: "index_reply_questions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.bigint "total_price"
    t.string "note"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_transactions_on_address_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.integer "gender"
    t.string "job"
    t.date "birthday"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "comment_ratings", "products"
  add_foreign_key "comment_ratings", "users"
  add_foreign_key "delivers", "transactions"
  add_foreign_key "delivers", "users"
  add_foreign_key "image_slides", "products"
  add_foreign_key "order_transactions", "orders"
  add_foreign_key "order_transactions", "transactions"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "questions", "products"
  add_foreign_key "questions", "users"
  add_foreign_key "reply_comments", "comment_ratings"
  add_foreign_key "reply_comments", "users"
  add_foreign_key "reply_questions", "questions"
  add_foreign_key "reply_questions", "users"
  add_foreign_key "transactions", "addresses"
  add_foreign_key "transactions", "users"
end
