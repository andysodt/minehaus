# frozen_string_literal: true

class Task < ApplicationRecord
  default_scope -> { order('created_at ASC') }
  belongs_to :project
  belongs_to :admin_user

  validates :title, :project_id, :admin_user_id, presence: true
  validates :is_done, inclusion: { in: [true, false] }
end
