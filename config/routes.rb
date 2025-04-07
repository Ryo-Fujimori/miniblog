Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users, only: %i[index create]
  resources :posts, only: %i[index new create show edit update destroy]
  resources :relationships, only: %i[create]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
