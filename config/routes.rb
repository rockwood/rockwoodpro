Rockwoodpro::Application.routes.draw do

  ActiveAdmin.routes(self)

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :recordings, only: [:new, :create]
  resources :password_resets do
    get :edit_legacy, on: :member
  end

  get "sign_up", to: "users#new"
  get "sign_out", to: "sessions#destroy"
  get "app", to: "app#show"

  root to: "sessions#new"

  namespace :api, defaults: {format: :json} do
    resources :recordings
    resources :pieces
  end
end
