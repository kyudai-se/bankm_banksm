class ChengeColumnBankCd < ActiveRecord::Migration
  def change
    remove_column :bankms, :bank_cd, :string
    add_column :bankms, :bank_cd, :integer, unique: true
  end
end
