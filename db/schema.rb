# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160519232417) do

  create_table "contracts", force: :cascade do |t|
    t.string   "responsable"
    t.integer  "amount"
    t.string   "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "rental_period"
    t.integer  "customer_id"
    t.date     "deadline"
    t.date     "started_at"
    t.integer  "receipt_id"
  end

  add_index "contracts", ["customer_id"], name: "index_contracts_on_customer_id"
  add_index "contracts", ["receipt_id"], name: "index_contracts_on_receipt_id"

  create_table "contracts_equipment", id: false, force: :cascade do |t|
    t.integer "contract_id",  null: false
    t.integer "equipment_id", null: false
  end

  add_index "contracts_equipment", ["contract_id"], name: "index_contracts_equipment_on_contract_id"
  add_index "contracts_equipment", ["equipment_id"], name: "index_contracts_equipment_on_equipment_id"

  create_table "customers", force: :cascade do |t|
    t.string   "cnpj"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "company_name"
    t.string   "contact_name"
    t.string   "tel"
    t.string   "contact_email"
    t.string   "billing_address"
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "supplier"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "serial_number"
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "duration"
    t.float    "total_value"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "equipment_id"
  end

  add_index "prices", ["equipment_id"], name: "index_prices_on_equipment_id"

  create_table "receipts", force: :cascade do |t|
    t.integer  "contract_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "receipts", ["contract_id"], name: "index_receipts_on_contract_id"

end
