Rails.application.routes.draw do
  resources :rooms
  root to: 'application#welcome'

  get 'chat/index', to: 'chat#index'

  resources :messages, only: [:new, :create]
  resources :questions
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
