Rails.application.routes.draw do
  root 'contracts#index'
  resources :equipment, only: [:index]
  resources :contracts, only: [:show, :index, :new, :create] do
    resources :receipts, only: [:show, :create]
  end
  resources :prices, only: [:index]

end
