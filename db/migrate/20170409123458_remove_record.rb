class RemoveRecord < ActiveRecord::Migration[5.0]
  def up
    remove_index :records, [:type, :name]
    drop_table :records
  end

  def down
    create_table :records do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :value, null: false

      t.timestamps null: false
    end

    add_index :records, [:type, :name], unique: true
  end
end
