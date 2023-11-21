Rails.application.routes.draw do
  devise_for :users

  resources :locations
  resources :teams
  resources :tournaments
  resources :stadia
  resources :matches
  resources :posts
  
  root "posts#index"
end
