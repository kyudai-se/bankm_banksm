class ChengeColumnBabkCd < ActiveRecord::Migration
  def change
    add_index :bankms, :bank_cd, unique: true
  end
end
