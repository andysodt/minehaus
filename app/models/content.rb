# frozen_string_literal: true

class Content < ApplicationRecord
  has_one_attached :attached_file
end
