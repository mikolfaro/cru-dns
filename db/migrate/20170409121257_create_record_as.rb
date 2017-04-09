class CreateRecordAs < ActiveRecord::Migration[5.0]
  def change
    create_table :record_as do |t|
      t.string :name
      t.string :type
      t.string :value
      t.integer :ttl_seconds
      t.boolean :active

      t.timestamps
    end
  end
end
