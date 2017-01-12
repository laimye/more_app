Rails.application.routes.draw do
  
  root "pages#show", page: 'home' # not sure about root yet..
  resources :users, only: [:new, :create]
  resources :pages

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
