class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :trainline_id
      t.string :station_name, null:false
      t.string :station_code, null:false

      t.timestamps
    end
  end
end
