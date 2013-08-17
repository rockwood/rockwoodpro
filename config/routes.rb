Rockwoodpro::Application.routes.draw do
  resources :users

  get "sign_up", to: "users#new"

  root to: "users#new"
end
