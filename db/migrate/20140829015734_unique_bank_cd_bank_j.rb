class UniqueBankCdBankJ < ActiveRecord::Migration
  def change
    add_index(:banksms,[:bank_cd, :banks_j],:unique => true)
  end
end
