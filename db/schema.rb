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

ActiveRecord::Schema[7.0].define(version: 2023_02_07_132358) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_exchanges", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_exchanges_on_book_id"
    t.index ["receiver_id"], name: "index_book_exchanges_on_receiver_id"
    t.index ["sender_id"], name: "index_book_exchanges_on_sender_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "author"
    t.string "published"
    t.string "condition"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.string "address"
    t.integer "phoneNumber"
    t.string "profile_pic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_exchanges", "books"
  add_foreign_key "book_exchanges", "users", column: "receiver_id"
  add_foreign_key "book_exchanges", "users", column: "sender_id"
end
