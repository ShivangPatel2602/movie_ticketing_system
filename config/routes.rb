Rails.application.routes.draw do
  resources :tickets
  resources :shows do
    resources :tickets, only: [:new, :create, :destroy]  # or include other actions as needed
  end
  resources :movies do
    resources :shows do
      resources :tickets, only: [:new, :create, :index]
    end
  end
  resources :admins, only: [:edit, :update, :index]
  root 'home#index'
  resources :users
  resources :admin_sessions, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: "users#new", as: 'signup'
  get 'login', to: "sessions#new", as: 'login'
  get 'logout', to: "sessions#destroy", as: 'logout'
  get 'admin_login', to: "admin_sessions#new", as: 'admin_login'
  get 'admin_logout', to: "admin_sessions#destroy", as: 'admin_logout'
end
