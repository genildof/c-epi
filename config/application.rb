require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
#Bundler.require(:default, Rails.env)

Bundler.require(*Rails.groups(assets: %w(development test)))

# this should be auto-included with the Bundler.require :default, Rails.env, but when not happening enable it here - Genildo
# require 'jquery-rails'

module CEpi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    #config.middleware.use "PDFKit::Middleware", :print_media_type => true


    # http://guides.rubyonrails.org/security.html
    # Sniff the cookie in an insecure network. A wireless LAN can be an example of such a network.
    # In an unencrypted wireless LAN it is especially easy to listen to the traffic of all connected clients.
    # This is one more reason not to work from a coffee shop. For the web application builder this means
    # to provide a secure connection over SSL. In Rails 3.1 and later, this could be accomplished by always
    # forcing SSL connection in your application config file:
    #config.force_ssl = true

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
