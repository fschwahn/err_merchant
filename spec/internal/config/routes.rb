Rails.application.routes.draw do
  match ':controller(/:action(/:id(.:format)))', via: :get
end
