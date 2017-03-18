class AddActiveToRecords < ActiveRecord::Migration
  def change
    add_column :records, :active, :boolean, null: false, default: false
  end
end
