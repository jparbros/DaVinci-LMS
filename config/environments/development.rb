Davinci::Application.configure do  
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request.  This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false        
  
  Slim::Engine.set_default_options :pretty => true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  
  class InspectableMemoryStore < ActiveSupport::Cache::MemoryStore
    def keys
      @data.keys
    end
  end

  config.cache_store = InspectableMemoryStore.new
  # config.cache_store = :memory_store
  config.action_controller.perform_caching = true

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  
  # Configure mail
  if ENV['DOMAIN_NAME'] and ENV['GMAIL_USERNAME'] and ENV['GMAIL_PASSWORD']
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => '587',
      :domain               => ENV['DOMAIN_NAME'],
      :user_name            => ENV['GMAIL_USERNAME'],
      :password             => ENV['GMAIL_PASSWORD'],
      :authentication       => 'plain',
      :enable_starttls_auto => true  }
  else
    config.action_mailer.delivery_method = :test      
  end
  
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
