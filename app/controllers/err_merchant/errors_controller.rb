class ErrMerchant::ErrorsController < ::ApplicationController
  ErrMerchant.skip_filters.each do |filter_type, filters|
    send(:"skip_#{filter_type}_action", *filters) if filters.any?
  end
  skip_forgery_protection

  ERRORS = {
    internal_server_error: 500,
    not_found: 404,
    conflict: 409,
    unprocessable_entity: 422,
    method_not_allowed: 405,
    not_implemented: 501
  }.freeze

  ERRORS.each do |e, status_code|
    define_method e do
      respond_to do |format|
        format.html { render "template", locals: { status_code: status_code }, layout: ErrMerchant.layout, status: e }
        format.any { head e }
      end
    end
  end
end
