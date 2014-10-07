Rails.application.routes.draw do
  resources :orders

  resources :items

  resources :customers
  root 'orders#index'
end
