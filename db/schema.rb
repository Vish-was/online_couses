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

ActiveRecord::Schema[7.0].define(version: 2023_05_04_034324) do
  create_table "coupons", force: :cascade do |t|
    t.float "discounted_amount"
    t.float "referral_amount"
    t.integer "limit", default: 10
    t.date "expiration"
    t.string "code"
    t.integer "purchase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_coupons_on_purchase_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.float "deposit_amount"
    t.float "final_balance"
    t.date "start_date"
    t.float "default_coupon_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.float "deposit_amount"
    t.float "final_balance"
    t.bigint "generated_coupon_id"
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.integer "coupon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_purchases_on_coupon_id"
    t.index ["course_id"], name: "index_purchases_on_course_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "reset_password_token"
    t.string "reset_password_sent_at"
    t.string "remember_created_at"
    t.string "encrypted_password"
    t.boolean "admin", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "privacy_accepted", default: false
    t.boolean "newsletter", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "coupons", "purchases"
  add_foreign_key "purchases", "coupons"
  add_foreign_key "purchases", "courses"
  add_foreign_key "purchases", "users"
end
