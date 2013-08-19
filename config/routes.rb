Rockwoodpro::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :recordings

  get "sign_up", to: "users#new"
  get "sign_out", to: "sessions#destroy"

  root to: "sessions#new"
end
