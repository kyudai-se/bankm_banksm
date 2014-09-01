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

ActiveRecord::Schema.define(version: 20140831230823) do

  create_table "aream", force: true do |t|
    t.datetime "entdate"
    t.string   "entmcn",  limit: 20,                         default: "", null: false
    t.string   "entclt",  limit: 20,                         default: "", null: false
    t.datetime "edtdate"
    t.string   "edtmcn",  limit: 20,                         default: "", null: false
    t.string   "edtclt",  limit: 20,                         default: "", null: false
    t.decimal  "area_cd",            precision: 4, scale: 0, default: 0,  null: false
    t.string   "area_j",  limit: 40,                         default: "", null: false
    t.string   "area_a",  limit: 40,                         default: "", null: false
    t.string   "area_k",  limit: 40,                         default: "", null: false
  end

  create_table "bankm", force: true do |t|
    t.datetime "entdate"
    t.string   "entmcn",    limit: 20,                         default: "", null: false
    t.string   "entclt",    limit: 20,                         default: "", null: false
    t.datetime "edtdate"
    t.string   "edtmcn",    limit: 20,                         default: "", null: false
    t.string   "edtclt",    limit: 20,                         default: "", null: false
    t.decimal  "bank_cd",              precision: 4, scale: 0, default: 0,  null: false
    t.string   "bank_j",    limit: 40,                         default: "", null: false
    t.string   "bank_a",    limit: 40,                         default: "", null: false
    t.string   "bank_k",    limit: 40,                         default: "", null: false
    t.integer  "banksm_id"
  end

  add_index "bankm", ["banksm_id"], name: "index_bankm_on_banksm_id", using: :btree

  create_table "bankms", id: false, force: true do |t|
    t.datetime "entdate"
    t.string   "entmcn",     limit: 20,                         default: "", null: false
    t.string   "entclt",     limit: 20,                         default: "", null: false
    t.datetime "edtdate"
    t.string   "edtmcn",     limit: 20,                         default: "", null: false
    t.string   "edtclt",     limit: 20,                         default: "", null: false
    t.decimal  "bank_cd",               precision: 4, scale: 0, default: 0,  null: false
    t.string   "bank_j",     limit: 40,                         default: "", null: false
    t.string   "bank_a",     limit: 40,                         default: "", null: false
    t.string   "bank_k",     limit: 40,                         default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bankms", ["bank_cd"], name: "index_bankms_on_bank_cd", unique: true, using: :btree

  create_table "banksms", id: false, force: true do |t|
    t.datetime "entdate"
    t.string   "entmcn",        limit: 20,                         default: "", null: false
    t.string   "entclt",        limit: 20,                         default: "", null: false
    t.datetime "edtdate"
    t.string   "edtmcn",        limit: 20,                         default: "", null: false
    t.string   "edtclt",        limit: 20,                         default: "", null: false
    t.decimal  "bank_cd",                  precision: 4, scale: 0, default: 0,  null: false
    t.decimal  "banks_cd",                 precision: 3, scale: 0, default: 0,  null: false
    t.decimal  "banks_ed",                 precision: 1, scale: 0, default: 0,  null: false
    t.string   "banks_j",       limit: 40,                         default: "", null: false
    t.string   "banks_a",       limit: 40,                         default: "", null: false
    t.string   "banks_k",       limit: 40,                         default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "bank_cd_copy",                                                  null: false
    t.decimal  "banks_cd_copy",                                                 null: false
    t.decimal  "banks_ed_copy",                                                 null: false
  end

  add_index "banksms", ["bank_cd", "banks_cd", "banks_ed"], name: "index_banksms_on_bank_cd_and_banks_cd_and_banks_ed", unique: true, using: :btree
  add_index "banksms", ["bank_cd", "banks_j"], name: "index_banksms_on_bank_cd_and_banks_j", unique: true, using: :btree

  create_table "lineups", force: true do |t|
    t.integer  "bankm_id"
    t.integer  "banksm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lineups", ["bankm_id"], name: "index_lineups_on_bankm_id", using: :btree
  add_index "lineups", ["banksm_id"], name: "index_lineups_on_banksm_id", using: :btree

end
