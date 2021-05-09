class User < ActiveRecord::Base
has_secure_password
has_many :user_factions
has_many :factions, through: :user_factions
end