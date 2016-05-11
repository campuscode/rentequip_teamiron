Rails.application.routes.draw do
  root 'contracts#index'
  resources :equipment, only: [:index]
  resources :contracts, only: [:show, :index, :new, :create]
  resources :prices, only: [:index]
end
