Rails.application.routes.draw do
  root "homes#index"
  get "homes/index"
  post "events/enrollment"
  get "sessions/new"
  get "sessions/create"
  get "users/new"
  get "events/profile"
  get 'events/add_comments'
  resources :events 
  
  get "signup", to: "users#new"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
