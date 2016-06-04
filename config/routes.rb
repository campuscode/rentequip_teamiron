Rails.application.routes.draw do
  devise_for :users
  root 'contracts#index'
  resources :equipment, only: [:index]
  resources :contracts, only: [:show, :index, :new, :create] do
    resources :receipts, only: [:show, :create]
  end
  resources :prices, only: [:index, :new, :create]
  resources :customers, only: [:new, :create, :show]

end
