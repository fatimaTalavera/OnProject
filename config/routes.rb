Rails.application.routes.draw do
  resources :materials
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
