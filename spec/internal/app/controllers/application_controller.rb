class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :raise_error

  private
    def raise_error
      raise RandomException if params[:raise_error] && is_a?(ErrMerchant::ErrorsController)
    end
end
