require 'rubygems'
require 'bundler/setup'

require 'combustion'
require 'capybara/rspec'

Combustion.initialize! :all do
  config.action_dispatch.show_exceptions = true
  config.consider_all_requests_local = false
  config.i18n.enforce_available_locales = false
end

require 'rspec/rails'
require 'capybara/rails'

RSpec.configure do |c|
  c.expose_current_running_example_as :example
  c.infer_spec_type_from_file_location!
  c.expect_with(:rspec) { |c| c.syntax = :should }
end
