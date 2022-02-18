Rails.application.routes.draw do
  root "homes#index"
  get "homes/index"
  get "sessions/new"
  get "sessions/create"
  get "users/new"
  get "events/profile"
  get "events/add_comments"
  resources :events, :enrollments
  get "users/register_event"
  get "signup", to: "users#new"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
end
