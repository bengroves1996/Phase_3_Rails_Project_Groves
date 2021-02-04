class Project < ApplicationRecord
    has_many :tasks 
    belongs_to :user
    has_many :task_project, :through => :task, :source => :user

    ##Rename macro same one from user
    #has_many :task_project, through :task, source user
    validates :description, :title, :priority, presence: true

    def self.high_priority
        Project.all.where(priority: :'5')
    end


end
