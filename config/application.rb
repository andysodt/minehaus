# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Minehaus
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.javascript_engine = :js
    config.app_generators.stylesheet_engine :less
    config.app_generators.scaffold_controller = :scaffold_controller
    config.generators do |generator|
      generator.orm :active_record, primary_key_type: :uuid
    end
  end
end
