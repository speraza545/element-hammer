class User < ActiveRecord::Base
has_secure_password
has_many :armies
has_many :factions, through: :armies

    def self.is_admin?(code)
        code.to_i === 123 ? true : false
    end


end