class AddIndexToRecords < ActiveRecord::Migration
  def change
    add_index :records, [:type, :name]
  end
end
