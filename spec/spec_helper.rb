require 'rubygems'
require 'bundler'

Bundler.require :default, :development

require 'capybara/rspec'

Combustion::Application.config.consider_all_requests_local = false
Combustion::Application.config.i18n.fallbacks = true
Combustion.initialize! :action_controller, :action_view

require 'rspec/rails'
require 'capybara/rails'
