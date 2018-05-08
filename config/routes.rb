Rails.application.routes.draw do
  root to: 'projects#index'
  
  resources :projects
  resources :tickets
  resources :tags, except: [:show]

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
end
