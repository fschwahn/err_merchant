require 'active_support/concern'

module ErrMerchant
  module ShowExceptionsPatch
    extend ActiveSupport::Concern

    included { alias_method_chain :render_exception, :template unless Rails.application.config.consider_all_requests_local }

    private
      def render_exception_with_template(env, exception)
        body = ErrorsController.action(rescue_responses[exception.class.name]).call(env)
        log_error(exception)
        body
      rescue
        render_exception_without_template(env, exception)
      end
  end
end
