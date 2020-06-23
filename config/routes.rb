Rails.application.routes.draw do
  # root 'users#index'
  resource :users, only: [:create]
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
  resource :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
