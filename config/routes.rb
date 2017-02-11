Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root to: "businesses#index"
  get '/register', to: 'users#new', as: :register
  get '/login', to: 'sessions#new', as: :login

  resources :businesses, only: [:index, :new, :create, :show] do
    resources :reviews, only: [:new, :create]
  end
  
  resources :reviews, only: [:index]
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
end
