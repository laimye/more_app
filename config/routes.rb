Rails.application.routes.draw do

	root 'trips#all'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :trips, shallow: true do
    resources :announcements
    resources :posts do
      resources :comments
    end
  end

  resources :users, shallow: true do
  	resources :announcements
  	resources :posts do
  		resources :comments
  	end
  end


end
