class CreateRecordBases < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :value, null: false

      t.timestamps null: false
    end

    add_index :records, [:type, :name], unique: true
  end
end
