BtcjamClient::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
end

BTCJAM_APP_ID = "f5b58e1154800d66423acd8ff157d782fbe7479eba118f8c3ea5645d50acbff5"
BTCJAM_APP_SECRET = "f95892e4ea48776b66a5048144c970ed677784e28dda8f7ed291947c54ce17fe"
BTCJAM_APP_URL = "http://localhost:3001"
