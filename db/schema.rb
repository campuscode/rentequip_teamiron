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

ActiveRecord::Schema.define(version: 20160512224148) do

  create_table "contracts", force: :cascade do |t|
    t.string   "responsable"
    t.string   "client"
    t.integer  "amount"
    t.string   "delivery_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "rental_period"
  end

  create_table "contracts_equipment", id: false, force: :cascade do |t|
    t.integer "contract_id",  null: false
    t.integer "equipment_id", null: false
  end

  add_index "contracts_equipment", ["contract_id"], name: "index_contracts_equipment_on_contract_id"
  add_index "contracts_equipment", ["equipment_id"], name: "index_contracts_equipment_on_equipment_id"

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "supplier"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.float    "total_value"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
