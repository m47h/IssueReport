require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module IssueReport
  class Application < Rails::Application
    config.time_zone = 'Europe/Warsaw'
    config.active_record.default_timezone = :local # Or :utc

    config.generators do |g|
      g.test_framework :rspec, views: false, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
  end
end
