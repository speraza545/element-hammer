class User < ActiveRecord::Base
has_secure_password
has_many :user_factions
has_many :factions, through: :user_factions

    def self.is_admin?(code)
        code.to_i === 123 ? true : false
    end


end