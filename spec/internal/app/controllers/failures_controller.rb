class FailuresController < ApplicationController
  def usual_action
  end

  def wild_error
    raise
  end

  def where_is_it
    raise ActiveRecord::RecordNotFound
  end

  def dont_process_this
    raise ActionController::InvalidAuthenticityToken
  end
end
