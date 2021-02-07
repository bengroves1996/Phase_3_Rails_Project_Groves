class User < ApplicationRecord
    has_secure_password
    has_many :projects
    has_many :tasks
    
    has_many :task_project, :through => :task, :source => :project
    validates :email, :username, presence: true
    validates :username, uniqueness: true
    

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            hash = {username: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex(16)}
            
            u.update(hash)
        end
    end
end
