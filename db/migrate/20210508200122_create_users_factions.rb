class CreateUsersFactions < ActiveRecord::Migration[6.1]
  def change
    create_table :users_factions do |t|
      t.references :users, index: true, foreign_key: true
      t.references :factions, index: true, foreign_key: true

      t.timestamps
    end
  end
end
