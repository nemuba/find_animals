# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  api_guard_scope "users" do
    post "api/v1/authenticate/sign_up" => "api_guard/registration#create"
    post "api/v1/authenticate/sign_in" => "api_guard/authentication#create"
  end

  namespace :api do
    namespace :v1 do
      resources :animals
      resources :categories
      resources :users
      get "/authenticate/user", to: "auth#index"
      get "/getlocation", to: "get_location#index"
    end
  end
end
