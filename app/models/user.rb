class User < ActiveRecord::Base
has_secure_password
has_many :factions, through: :users_factions
has_many :users_factions
end