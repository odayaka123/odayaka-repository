Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'posts/create'
  get 'posts/edit'
  get 'posts/update'
  get 'posts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  root "home#index"
  get "signup", to: "users#new"
  post "users", to: "users#create"

  get "login", to: "sessions#new"
  post "sessions", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :posts
end
