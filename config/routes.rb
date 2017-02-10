Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root to: "businesses#index"  

  resources :businesses, only: [:index, :new, :create]
end
