# frozen_string_literal: true

class Project < ApplicationRecord
  default_scope -> { order('created_at ASC') }
  validates :title, presence: true
  has_many :tasks
  has_one_attached :avatar
end
