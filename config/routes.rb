Rails.application.routes.draw do
  resources :equipment, only: [:index]
  resources :contracts, only: [:show, :index, :new, :create]
end
