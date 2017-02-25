Rails.application.routes.draw do
  resources :movement_details
  resources :material_movements
  resources :materials
  root to: 'welcome#index'
  get 'welcome/index'
  devise_for :users
  resources :users
end
