Rails.application.routes.draw do
  resources :failures, :only => [:index, :show, :edit]
end
