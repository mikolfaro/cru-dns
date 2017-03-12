class AddActiveToRecords < ActiveRecord::Migration
  def change
    add_column :records, :active, :boolean, null: false
  end
end
