require 'rails/engine'
require 'err_merchant/show_exceptions_patch'

module ErrMerchant
  class Engine < ::Rails::Engine
    initializer "err_merchant.show_exceptions_patch" do
      ActionDispatch::ShowExceptions.send(:include, ShowExceptionsPatch)
    end
  end
end
