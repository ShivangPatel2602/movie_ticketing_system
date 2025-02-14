Rails.application.routes.draw do
  root "home#index"

  # Users & Authentication
  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]
  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  get "logout", to: "sessions#destroy", as: "logout"

  # Admin Authentication
  resources :admins, only: [ :edit, :update ]
  resources :admin_sessions, only: [ :new, :create, :destroy ]
  get "admin_login", to: "admin_sessions#new", as: "admin_login"
  get "admin_logout", to: "admin_sessions#destroy", as: "admin_logout"

  # Movies & Shows (Nesting for correct path helpers)
  resources :movies do
    resources :shows, only: [ :index, :show, :new, :create ] # Shows must belong to a Movie
  end

  resources :shows, except: [ :index, :show, :new, :create ] # Admin Show Management

  # Tickets (Users Only)
  resources :tickets
end
