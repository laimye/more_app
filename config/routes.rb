Rails.application.routes.draw do

	root 'trips#all'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/trips/:trip_id/crew', to: 'users#index', as: :crew

  get '/posts/:post_id/like', to: 'users#like', as: :like
  get '/posts/:post_id/unlike', to: 'users#unlike', as: :unlike

  resources :trips, shallow: true do
    resources :invites
    resources :announcements 
    resources :posts do
      resources :comments
    end
  end

  resources :users, except: :index, shallow: true do
  	resources :announcements
  	resources :posts do
  		resources :comments
  	end
  end

end
