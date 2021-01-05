class FailuresController < ApplicationController
  skip_forgery_protection(if: -> { params[:skip_csrf] })

  def usual_action
  end

  def wild_error
    raise
  end

  def where_is_it
    raise ActiveRecord::RecordNotFound
  end

  def dont_process_this
    raise ActionController::InvalidCrossOriginRequest
  end
end
