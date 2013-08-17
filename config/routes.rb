Rockwoodpro::Application.routes.draw do
  resources :users
  resources :sessions, only: [:create]

  get "sign_up", to: "users#new"

  root to: "sessions#new"
end
