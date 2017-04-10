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
  resources :roles, except: [:destroy]
  resources :permissions, only: [:create, :update, :destroy]
  devise_for :users
  resources :users
  root to: 'welcome#index'
  get 'welcome/index'
  get '/users/me', to: 'users#edit_profile', as: 'edit_profile'
  post '/users/me', to: 'users#update_profile', as: 'update_profile'
  get 'company_config', to: 'company_config#edit_company', as: 'edit_company'
  post 'company_config', to: 'company_config#update_company', as: 'update_company'
end
