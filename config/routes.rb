Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  api_guard_routes for: "users"
  
  namespace :api do
    namespace :v1 do
      resources :animals
      resources :categories
      resources :users
      get "/getlocation", to: "get_location#index"
    end
  end
end
