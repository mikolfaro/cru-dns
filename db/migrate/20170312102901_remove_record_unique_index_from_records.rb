class RemoveRecordUniqueIndexFromRecords < ActiveRecord::Migration
  def up
    remove_index :records, [:type, :name]
  end

  def down
    add_index :records, [:type, :name], unique: true
  end
end
