Rails.application.routes.draw do
  devise_for :users

  get 'locations/searchposts', to: 'locations#searchposts'

  resources :locations
  resources :teams
  resources :tournaments
  resources :stadia
  resources :matches
  resources :posts
  
  root "posts#index"
end
