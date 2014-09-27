class CreateAreams < ActiveRecord::Migration
  def change
    create_table "areams", force: true do |t|
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
      t.timestamps
    end
    add_index "areams", ["area_cd"], name: "index_areams_on_area_cd", unique: true, using: :btree
  end
end
