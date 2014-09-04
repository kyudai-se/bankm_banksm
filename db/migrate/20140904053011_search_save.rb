class SearchSave < ActiveRecord::Migration
  def change
    add_column :bankms, :bank_j_copy, :string, default: "", null: false
  end
end
