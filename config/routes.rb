Rails.application.routes.draw do
  resources :rubros
  resources :internal_certifications, except: [:show]
  resources :client_certifications
  resources :employees
  resources :purchase_bills, except: [:edit, :update]
  resources :providers
  resources :services
  resources :contracts
  resources :clients
  resources :materials
  resources :movement_details
  resources :material_movements
  resources :roles
  resources :permissions
  root to: 'welcome#index'
  get 'welcome/index'
  devise_for :users
  get '/users/me', to: 'users#edit_profile', as: 'edit_profile'
  post '/users/me', to: 'users#update_profile', as: 'update_profile'
  resources :users
  resources :company_config, only: [:index, :edit, :update]
end
