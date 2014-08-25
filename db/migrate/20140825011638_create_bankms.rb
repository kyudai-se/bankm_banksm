class CreateBankms < ActiveRecord::Migration
  def change
    create_table :bankms, id: false do |t|
      t.datetime  "entdate"
      t.string  "entmcn",   limit: 20, default: "", null: false
      t.string  "entclt",   limit: 20, default: "", null: false
      t.datetime  "edtdate"
      t.string  "edtmcn",   limit: 20, default: "", null: false
      t.string  "edtclt",   limit: 20, default: "", null: false
      t.decimal "bank_cd",  precision: 4, scale: 0, default: 0,  null: false
      t.string  "bank_j",  limit: 40, default: "", null: false
      t.string  "bank_a",  limit: 40, default: "", null: false
      t.string  "bank_k",  limit: 40, default: "", null: false
      t.timestamps
    end
    add_index :bankms, :bank_cd, unique: true
  end
end
