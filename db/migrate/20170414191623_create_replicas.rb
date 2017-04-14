class CreateReplicas < ActiveRecord::Migration[5.0]
  def change
    create_table :replicas do |t|
      t.string :ip
      t.string :api_token

      t.timestamps
    end
  end
end
