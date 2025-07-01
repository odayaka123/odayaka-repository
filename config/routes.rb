Rails.application.routes.draw do
  root "home#index"

  get "signup", to: "users#new"
  post "users", to: "users#create"

  get "login", to: "sessions#new"
  post "sessions", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
