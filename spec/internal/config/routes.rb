Rails.application.routes.draw do
  post "csrf_error" => "failures#usual_action"
  post "post_error" => "failures#wild_error"

  match ':controller(/:action(/:id(.:format)))', via: :get
end
