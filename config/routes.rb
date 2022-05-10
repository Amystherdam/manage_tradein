Rails.application.routes.draw do
  devise_for :users
  resources :sales
  resources :products
  resources :customers

  root to: 'sales#index'
end
