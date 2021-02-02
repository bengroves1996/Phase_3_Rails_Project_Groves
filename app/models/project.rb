class Project < ApplicationRecord
    has_many :tasks 
    has_many :users, through: :tasks
    validates :description, :title, :priority, presence: true

    def self.high_priority
        self.where(priority: :5)
    end


end
