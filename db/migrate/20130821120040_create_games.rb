class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :fan
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :num_clicks
      t.integer :total_time
      t.string :ref

      t.timestamps
    end
    add_index :games, :fan_id
  end
end
