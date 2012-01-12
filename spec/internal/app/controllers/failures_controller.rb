class FailuresController < ActionController::Base
  def index
    raise
  end
  
  def show
    raise ActiveRecord::RecordNotSaved
  end
  
  def edit
    raise ActiveRecord::RecordNotFound
  end
end