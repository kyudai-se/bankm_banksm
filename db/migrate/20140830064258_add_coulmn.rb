class AddCoulmn < ActiveRecord::Migration
  def change
    add_column :banksms, :bank_cd_copy,  :decimal, null: false, default: 0
    add_column :banksms, :banks_cd_copy, :decimal, null: false, default: 0
    add_column :banksms, :banks_ed_copy, :decimal, null: false, default: 0
  end
end
