Rails.application.routes.draw do
  resources :orders

  resources :items

  resources :customers
  root 'customers#index'
end
