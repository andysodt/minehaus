class Project < ApplicationRecord
    default_scope -> { order("created_at ASC") }
    validates :title, :presence => true
    has_many :tasks
end
