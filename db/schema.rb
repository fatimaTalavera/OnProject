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

ActiveRecord::Schema.define(version: 20170306185129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "identification_document"
    t.string "email"
    t.string "adress"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "client_id"
    t.date "start_date"
    t.date "end_date"
    t.string "name"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id", using: :btree
  end

  create_table "material_movements", force: :cascade do |t|
    t.date "fecha"
    t.string "motivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contract_id"
    t.index ["contract_id"], name: "index_material_movements_on_contract_id", using: :btree
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.decimal "quantity"
    t.integer "minimun_stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "measurement_unit"
  end

  create_table "movement_details", force: :cascade do |t|
    t.integer "material_movement_id"
    t.integer "material_id"
    t.float "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_movement_details_on_material_id", using: :btree
    t.index ["material_movement_id"], name: "index_movement_details_on_material_movement_id", using: :btree
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contracts", "clients"
  add_foreign_key "material_movements", "contracts"
  add_foreign_key "movement_details", "material_movements"
  add_foreign_key "movement_details", "materials"
end
