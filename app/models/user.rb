class User < ApplicationRecord
    has_secure_password
    has_many :tasks, through: :projects
    has_many :projects
    validates :email, :username, presence: true
    validates :username, uniqueness: true

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            hash = {username: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex(16)}
            
            u.update(hash)
        end
    end
end
