class Faction < ActiveRecord::Base 
has_many :users_factions
has_many :users, through: :users_factions
end