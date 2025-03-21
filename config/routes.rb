Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: %i[index new create edit update destroy]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
