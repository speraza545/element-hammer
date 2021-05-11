class CreateUserFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_factions do |t|
      t.string :army_name
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :faction, null: false, foreign_key: true
      t.timestamps
    end
  end
end
