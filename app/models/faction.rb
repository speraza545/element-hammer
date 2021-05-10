class Faction < ActiveRecord::Base 
has_many :armies
has_many :users, through: :armies
end