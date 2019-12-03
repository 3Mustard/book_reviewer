Rails.application.routes.draw do
  #root path
  get '/' => 'sessions#home'

  #routes for login/sign up/logout 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  #resources
  resources :comments
  resources :books
  resources :reviews
  resources :users
end
