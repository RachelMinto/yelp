Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root to: "businesses#index"
  get '/register', to: 'users#new', as: :register
  get '/login', to: 'sessions#new', as: :login

  resources :businesses, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]  
end
