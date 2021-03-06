Rails.application.routes.draw do
  resources :authors
  #root path
  get '/' => 'sessions#home'

  ##routes for login/sign up/logout 
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  #omniauth
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  ##custom features
  get '/books/recently_added' => 'books#recently_added'
  
  #needed for path book/review/new or edit 
  resources :books do 
    resources :reviews, only: [:new,:edit]
  end  
  resources :reviews
  resources :users
end
