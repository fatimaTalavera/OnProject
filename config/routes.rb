Rails.application.routes.draw do
  resources :movement_details
  resources :material_movements
  resources :materials
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
