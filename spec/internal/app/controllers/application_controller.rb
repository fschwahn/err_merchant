class ApplicationController < ActionController::Base
  protect_from_forgery(with: :exception)

  before_action :raise_error

  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_csrf_error

  private
    def raise_error
      raise RandomException if params[:raise_error] && is_a?(ErrMerchant::ErrorsController)
    end

    def app_title
      "ErrMerchant Test Application"
    end
    helper_method :app_title

    def handle_csrf_error(exception)
      if params[:skip_csrf]
        redirect_to "/failures/usual_action"
      else
        raise exception
      end
    end
end
