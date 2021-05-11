class CreateTransits < ActiveRecord::Migration[6.0]
  def change
    create_table :transits do |t|
      t.integer :changes_to_id   # changes to trainlines. ie. - mannar line, direct_line etc.
      #t.integer :changes_from_id # from which station transtit line start. ie.- ella, awissawella etc. 
      t.integer :station_id
      t.timestamps
    end
  end
end
