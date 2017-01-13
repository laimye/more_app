Rails.application.routes.draw do


  root "trips#all"
  resources :users
  resources :pages
  resources :trips
  resources :posts
  resources :comments

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
