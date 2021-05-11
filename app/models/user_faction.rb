class UserFaction < ApplicationRecord
    belongs_to :faction 
    belongs_to :user
    validates :army_name, presence: true, uniqueness: true
validates :user_id, presence: true
validates :user_id, presence: true

end