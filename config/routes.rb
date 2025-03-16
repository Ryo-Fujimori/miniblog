Rails.application.routes.draw do
  root "posts#index"
  resource :posts, only: %i(new create)
  get "up" => "rails/health#show", as: :rails_health_check

end
