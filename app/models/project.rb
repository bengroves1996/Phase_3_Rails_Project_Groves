class Project < ApplicationRecord
    has_many :tasks 
    has_many :users, through: :tasks
    validates :description, :title, :priority, presence: true

    def self.high_priority
        Project.all.where(priority: :'5')
    end


end
