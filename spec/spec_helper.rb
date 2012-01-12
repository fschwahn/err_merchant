require 'rubygems'
require 'bundler'

Bundler.require :default, :development

require 'capybara/rspec'

Combustion::Application.config.consider_all_requests_local = false
Combustion::Application.config.i18n.fallbacks = true
Combustion.initialize!

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
end
