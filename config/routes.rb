Rockwoodpro::Application.routes.draw do

  ActiveAdmin.routes(self)

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :recordings
  resources :password_resets do
    get :edit_legacy, on: :member
  end

  get "sign_up", to: "users#new"
  get "sign_out", to: "sessions#destroy"

  root to: "sessions#new"

  namespace :api, defaults: {format: :json} do
    resources :recordings
    resources :pieces
  end
end
