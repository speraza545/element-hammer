class UserFaction < ApplicationRecord
    belongs_to :faction 
    belongs_to :user
    validates :army_name, presence: true, uniqueness: true
    validates :user_id, presence: true
    validates :user_id, presence: true
    scope :find_all_factions, -> {limit (100)}
    scope :order_by_army_name, -> { find_all_factions.order(army_name: :asc) }


end