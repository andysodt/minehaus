# frozen_string_literal: true

class Resource < ApplicationRecord
  has_one_attached :attached_file

  attribute :url, :string

  def url
    Rails.application.routes.url_helpers.rails_blob_path(self.attached_file, disposition: "attachment", only_path: true)
  end

end
