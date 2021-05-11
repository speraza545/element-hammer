class Faction < ApplicationRecord
# scope by_name  order(:name)
has_many :user_factions
has_many :users, through: :user_factions
end