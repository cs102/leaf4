require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Leaf4
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    #config.action_view.field_error_proc = Proc.new do |html_tag, instance|
    #  if instance.error_message.kind_of?(Array)
    #    %(<span class="validation-error">#{html_tag}</span>).html_safe
    #  else
    #    %(#{html_tag}<span class="validation-error">&nbsp;</span>).html_safe
    #  end
    #end

    # wrap each form field that has an error with the following. 
    # note, condition for arrays and singletons.
    #    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
    #      if instance.error_message.kind_of?(Array)
    #        %(<span class="help-inline">#{html_tag}</span>).html_safe
    #      else
    #        %(#{html_tag}<span class="help-inline">&nbsp;</span>).html_safe
    #      end
    #end

  end
end
