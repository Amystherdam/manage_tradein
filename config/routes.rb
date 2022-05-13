Rails.application.routes.draw do
  get 'dashboard/index'
  
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  resources :user_management
  post '/user_management/:id', to: 'user_management#create', as: 'create_by_management'
  patch '/user_management/:id', to: 'user_management#update', as: 'update_by_management'
  delete '/user_management/:id', to: 'user_management#destroy', as: 'delete_by_management'
  
  resources :sales
  resources :products
  resources :customers

  root to: 'dashboard#index'
end
