require 'rails/engine'
require 'err_merchant/exceptions_app'

module ErrMerchant
  class Engine < ::Rails::Engine
    initializer "err_merchant.set_exceptions_app" do |app|
      app.config.exceptions_app = ErrMerchant::ExceptionsApp.new
    end
  end
end
