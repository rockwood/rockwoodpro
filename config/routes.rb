Rockwoodpro::Application.routes.draw do

  ActiveAdmin.routes(self)

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :password_resets do
    get :edit_legacy, on: :member
  end
  resource :calendar, only: [:show]
  resource :live, controller: :live

  get "sign_up", to: "users#new"
  get "sign_out", to: "sessions#destroy"

  get "app", to: "app#show"
  get "app/*path", to: "app#show"

  root to: "sessions#new"

  get "/pages/:page" => "pages#show"

  namespace :api, defaults: { format: :json } do
    resources :recordings do
      get :demo, on: :collection
    end
    resources :pieces
  end
end
