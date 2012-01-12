require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion::Application.config.consider_all_requests_local = false
Combustion.initialize!
run Combustion::Application
