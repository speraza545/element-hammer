class UserFaction < ActiveRecord::Base
    belongs_to :faction 
    belongs_to :user
end