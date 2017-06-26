require_relative 'boot'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.generators do |g|
      g.coffee     false
      g.test       false
      g.helper     false
    end

    config.i18n.default_locale = :ja #日本語化
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # DBの基準時刻をTOKYOに
  end
end
