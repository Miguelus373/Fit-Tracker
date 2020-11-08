Rails.application.routes.draw do
  resources :categories
  resources :exercises
  resources :groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'sessions#index'
  
  get 'menu', to: 'sessions#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
