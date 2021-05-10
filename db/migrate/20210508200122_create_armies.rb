class CreateArmies < ActiveRecord::Migration[6.1]
  def change
    create_table :armies do |t|
      t.text :army_name
      t.integer :user_id
      t.integer :faction_id

      t.timestamps
    end
  end
end
