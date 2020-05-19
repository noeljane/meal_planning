Rails.application.routes.draw do
  root 'users#index'
  post '/login', to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to "auth#user_is_authed"
  # delete '/logout', to: 'sessions#destroy'
  # get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create]
  resources :meals
  # root 'homepage#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
