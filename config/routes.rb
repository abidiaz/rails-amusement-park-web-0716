Rails.application.routes.draw do
  resources :rides
  resources :users
  resources :attractions

  get '/', to: 'application#index', as: 'root_url'
  get '/signin', to: 'session#new', as: 'signin'
  post '/signin', to: 'session#create', as: 'new_session'
  get '/logout', to: 'session#destroy', as: 'logout'


end