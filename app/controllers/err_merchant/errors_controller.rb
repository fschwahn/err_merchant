class ErrMerchant::ErrorsController < ApplicationController
  ERRORS = {
    :internal_server_error => '500',
    :not_found => '404',
    :conflict => '500',
    :unprocessable_entity => '422',
    :method_not_allowed => '500',
    :not_implemented => '500'
  }.freeze

  ERRORS.each do |e, template|
    define_method e do
      respond_to do |format|
        format.html { render template, :status => e }
        format.any { head e }
      end
    end
  end
end
