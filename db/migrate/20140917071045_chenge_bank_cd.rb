class ChengeBankCd < ActiveRecord::Migration
  def change
    remove_column :bankms, :bank_cd, :decimal
    add_column :bankms, :bank_cd, :string
  end
end
