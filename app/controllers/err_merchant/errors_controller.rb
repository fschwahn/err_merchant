class ErrMerchant::ErrorsController < ApplicationController
  skip_authorization_check if defined?(::CanCan)
  
  ERRORS = {
    :internal_server_error => 500,
    :not_found => 404,
    :conflict => 409,
    :unprocessable_entity => 422,
    :method_not_allowed => 405,
    :not_implemented => 501
  }.freeze

  ERRORS.each do |e, status_code|
    define_method e do
      respond_to do |format|
        format.html { render 'template', :locals => {:status_code => status_code}, :status => e }
        format.any { head e }
      end
    end
  end
end
