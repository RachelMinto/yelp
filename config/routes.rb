Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root to: "businesses#index"
  get '/register', to: 'users#new', as: :register

  resources :businesses, only: [:index, :new, :create]
  resources :users, only: [:new, :create, :show]
end
