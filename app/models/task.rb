class Task < ApplicationRecord
    belongs_to :project
    belongs_to :user
    validates :objective, presence: true
end
