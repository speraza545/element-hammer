class CreateUserFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_factions do |t|
      t.text :username
      t.integer :user_id
      t.integer :faction_id

      t.timestamps
    end
  end
end
