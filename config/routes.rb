Rails.application.routes.draw do
  resources :comments
  resources :books
  resources :reviews
  resources :users
  root 'application#home'
end
