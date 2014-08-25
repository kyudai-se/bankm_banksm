class CreateBanksms < ActiveRecord::Migration
  def change
    create_table :banksms, :id => false do |t|
      t.datetime  "entdate"
      t.string  "entmcn",   limit: 20, default: "", null: false
      t.string  "entclt",   limit: 20, default: "", null: false
      t.datetime  "edtdate"
      t.string  "edtmcn",   limit: 20, default: "", null: false
      t.string  "edtclt",   limit: 20, default: "", null: false
      t.decimal "bank_cd",  precision: 4, scale: 0, default: 0,  null: false
      t.decimal "banks_cd", precision: 3, scale: 0, default: 0,  null: false
      t.decimal "banks_ed",  precision: 1, scale: 0, default: 0,  null: false
      t.string  "banks_j",  limit: 40, default: "", null: false
      t.string  "banks_a",  limit: 40, default: "", null: false
      t.string  "banks_k",  limit: 40, default: "", null: false
      t.timestamps
    end
    add_index :banksms, [:bank_cd, :banks_cd, :banks_ed], unique: true
  end
end
