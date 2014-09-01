class ChangeColumn < ActiveRecord::Migration
  def change
    remove_column :banksms, :bank_cd_copy
    remove_column :banksms, :banks_cd_copy
    remove_column :banksms, :banks_ed_copy

    add_column :banksms, :bank_cd_copy,  :decimal, null: false, default: '0'
    add_column :banksms, :banks_cd_copy, :decimal, null: false, default: '0'
    add_column :banksms, :banks_ed_copy, :decimal, null: false, default: '0'
  end
end
