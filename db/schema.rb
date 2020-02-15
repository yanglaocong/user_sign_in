# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_15_010624) do

  create_table "auth_codes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "短信验证码", force: :cascade do |t|
    t.string "mobile", null: false, comment: "手机号"
    t.string "token", null: false, comment: "验证码"
    t.datetime "expired_at", null: false, comment: "有效期"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mobile"], name: "index_auth_codes_on_mobile", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用户信息表", force: :cascade do |t|
    t.string "mobile", null: false, comment: "手机号"
    t.string "name", comment: "用户名"
    t.integer "gender", comment: "性别"
    t.string "token", comment: "jwt token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mobile"], name: "index_users_on_mobile", unique: true
  end

end
