class CreateFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :factions do |t|
      t.string :name
      t.string :buff_type
      t.integer :buff 
      t.timestamps
    end
  end
end
