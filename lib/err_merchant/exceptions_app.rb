require 'action_dispatch/middleware/public_exceptions'

module ErrMerchant
  class ExceptionsApp
    def call(env)
      status = env["PATH_INFO"][1..-1]
      ErrMerchant::ErrorsController.action(Rack::Utils::SYMBOL_TO_STATUS_CODE.invert[status.to_i]).call(env)
    rescue
      ActionDispatch::PublicExceptions.new(Rails.root.join('public')).call(env)
    end
  end
end
