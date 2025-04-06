Rails.application.routes.draw do
  get "relationships/create"
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root 'posts#index'
  resources :posts, only: %i[index new create show edit update destroy]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
