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

ActiveRecord::Schema.define(version: 20180402200720) do

  create_table "book_checkouts", force: :cascade do |t|
    t.integer "book_id"
    t.integer "checkout_id"
    t.date "checked_out_date"
    t.date "returned_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_requests", force: :cascade do |t|
    t.string "status"
    t.datetime "accepted_at"
    t.date "delivery_date"
    t.datetime "delivered_at"
    t.datetime "picked_up_at"
    t.string "request_data"
    t.integer "cat_id"
    t.integer "cat_reading_wrangler_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cat_id"], name: "index_book_requests_on_cat_id"
    t.index ["cat_reading_wrangler_id"], name: "index_book_requests_on_cat_reading_wrangler_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.string "title"
    t.integer "library_id"
    t.string "status"
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "cat_reading_wranglers", force: :cascade do |t|
    t.string "library_card_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "library_id"
    t.index ["library_id"], name: "index_cat_reading_wranglers_on_library_id"
    t.index ["user_id"], name: "index_cat_reading_wranglers_on_user_id"
  end

  create_table "cats", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.text "bio"
    t.integer "user_id"
    t.boolean "profile_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cats_on_user_id"
  end

  create_table "checkouts", force: :cascade do |t|
    t.integer "book_request_id"
    t.integer "library_id"
    t.date "return_due_date"
    t.datetime "returned_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_request_id"], name: "index_checkouts_on_book_request_id"
    t.index ["library_id"], name: "index_checkouts_on_library_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phone_number"
    t.string "street_address_1"
    t.string "street_address_2"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "contactable_type"
    t.integer "contactable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
