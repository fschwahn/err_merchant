require 'rubygems'
require 'bundler/setup'

require 'combustion'
require 'capybara/rspec'

Combustion.initialize! :all do
  config.action_dispatch.show_exceptions = true
  config.consider_all_requests_local = false
  config.i18n.fallbacks = true
end

require 'rspec/rails'
require 'capybara/rails'
