class Faction < ActiveRecord::Base 
has_many :user_factions
has_many :users, through: :user_factions
end