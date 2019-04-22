# frozen_string_literal: true

class Resource < ApplicationRecord
  has_one_attached :attached_file
end
