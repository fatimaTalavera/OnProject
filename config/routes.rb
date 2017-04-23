Rails.application.routes.draw do
  resources :budgets
  resources :rubros
  resources :certifications, except: [:destroy]
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
  resources :audit, only: [:index]
  root to: 'welcome#index'
  get 'welcome/index'
  get 'profile', to: 'users#edit_profile', as: 'edit_profile'
  post 'profile', to: 'users#update_profile', as: 'update_profile'
  devise_for :users
  resources :users
  get 'company_config', to: 'company_config#edit_company', as: 'edit_company'
  post 'company_config', to: 'company_config#update_company', as: 'update_company'
  resources :budgets do
    resources :budgets_details
  end
end
