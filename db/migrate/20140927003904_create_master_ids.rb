class CreateMasterIds < ActiveRecord::Migration
  def change
    create_table :master_ids do |t|
      t.integer :master_id
      t.string  :master_name
      t.timestamps
    end
  end
end
