Rails.application.routes.draw do
  devise_for :users
  
  resources :user_management
  post '/user_management/:id', to: 'user_management#create', as: 'create_by_management'
  patch '/user_management/:id', to: 'user_management#update', as: 'update_by_management'
  delete '/user_management/:id', to: 'user_management#destroy', as: 'delete_by_management'
  
  resources :sales
  resources :products
  resources :customers

  root to: 'sales#index'
end
