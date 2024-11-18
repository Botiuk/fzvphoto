# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fzvphoto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Permitted locales available for the application
    I18n.available_locales = [:uk]

    # Set default locale to something other than :uk
    I18n.default_locale = :uk
  end
end
