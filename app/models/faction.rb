class Faction < ApplicationRecord
# scope by_name  order(:name)
has_many :user_factions, dependent: :destroy
has_many :users, through: :user_factions
validates :name, presence: true
validates :buff_type, presence: true
validates :buff, presence: true
validates :info, presence: true
end