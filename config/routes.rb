Rails.application.routes.draw do
  resources :users, param: :_username
  resources :courses
  post '/auth/login', to: 'authentication#login'
end