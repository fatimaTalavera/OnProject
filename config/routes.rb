Rails.application.routes.draw do
  resources :sale_bills, except: [:destroy, :update]
  resources :concepts
  resources :account_employees, except: [:destroy]
  resources :budgets do
    member do
      get :cancel
      get :deliver
      get :get_detail
    end
  end
  #resources :budgets
  get 'rubros/search' => 'rubros#search'
  resources :rubros
  resources :certifications, except: [:destroy] do
    member do
      get :rejected
      get :approved
    end
  end
  resources :client_certifications
  get 'employees/search' => 'employees#search'
  resources :employees
  resources :purchase_bills
  get 'providers/search' => 'providers#search'
  resources :providers
  get 'services/search' => 'services#search'
  resources :services
  get 'contracts/search' => 'contracts#search'
  resources :contracts
  get 'clients/search' => 'clients#search'
  resources :clients
  get 'materials/search' => 'materials#search'
  resources :materials
  resources :movement_details
  resources :material_movements
  resources :roles, except: [:destroy]
  resources :permissions, only: [:create, :update, :destroy]
  resources :audit, only: [:index]
  resources :installment_payment
  resources :installment_payment_purchase
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
