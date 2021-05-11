class UserFaction < ApplicationRecord
    belongs_to :faction 
    belongs_to :user
    validates :army_name, presence: true, uniqueness: true
validates :user_id, presence: true
validates :user_id, presence: true

    def self.convert_name_to_id(faction_name)
        Faction.find_by(name: faction_name).id
    end
end