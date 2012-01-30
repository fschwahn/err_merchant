require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion::Application.config.consider_all_requests_local = false
Combustion.initialize! :active_record, :action_controller, :action_view
run Combustion::Application
