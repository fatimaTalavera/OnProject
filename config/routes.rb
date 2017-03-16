Rails.application.routes.draw do
  resources :services
  resources :contracts
  resources :clients
  resources :materials
  resources :movement_details
  resources :material_movements
  resources :materials
  root to: 'welcome#index'
  get 'welcome/index'
  devise_for :users
  resources :users
end
