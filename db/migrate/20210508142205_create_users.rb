class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, :default => "User#{rand(1..5000)}" 
      t.string :email
      t.string :password_digest
      t.integer :code
      t.string :uid
      t.string :provider
      t.timestamps
    end
  end
end
