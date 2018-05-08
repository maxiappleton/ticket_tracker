Rails.application.routes.draw do
  root to: 'projects#index'
  
  resources :projects
  resources :tickets
  resources :tags, except: [:show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
