Rails.application.routes.draw do
  resources :exercises, only: [:index, :new, :create]
  resources :groups, only: [:index, :new, :show, :create]
  resources :users, only: [:new, :create]
  
  root 'sessions#index'
  
  get 'menu', to: 'sessions#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
