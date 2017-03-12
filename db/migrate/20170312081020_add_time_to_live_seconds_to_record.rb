class AddTimeToLiveSecondsToRecord < ActiveRecord::Migration
  def change
    add_column :records, :ttl_seconds, :integer, null: false, default: 28800
  end
end
