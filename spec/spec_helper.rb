require 'rubygems'
require 'bundler/setup'

require 'combustion'
require 'capybara/rspec'

Combustion.initialize! :all do
  config.action_dispatch.show_exceptions = :all
  config.consider_all_requests_local = false
  config.i18n.enforce_available_locales = false
  config.action_controller.allow_forgery_protection = true
  config.cache_classes = false
end

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
  c.infer_spec_type_from_file_location!
  c.expect_with(:rspec) { |c| c.syntax = :should }
end

ErrMerchant.skip_filters[:before] = [:raise_error]
