class CreateBankmForms < ActiveRecord::Migration
  def change
    create_table :bankm_forms do |t|

      t.timestamps
    end
  end
end
