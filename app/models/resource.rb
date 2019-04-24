# frozen_string_literal: true

class Resource < ApplicationRecord
  has_one_attached :attached_file

  attribute :url, :string

  def url
    if self.attached_file.attached?
      if self.attached_file.previewable?
        return Rails.application.routes.url_helpers.rails_representation_url(self.attached_file.preview(resize: '150x150').processed, only_path: true)
      elsif self.attached_file.variable?
        return Rails.application.routes.url_helpers.rails_representation_url(self.attached_file.variant(resize: '150x150').processed, only_path: true)
      end
    end

    "No Preview"
  end

end
