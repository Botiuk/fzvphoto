Rails.application.routes.draw do
  devise_for :users

  get 'locations/searchposts', to: 'locations#searchposts'
  get 'teams/searchposts', to: 'teams#searchposts'
  get 'stadia/searchposts', to: 'stadia#searchposts'

  resources :locations
  resources :teams
  resources :tournaments
  resources :stadia
  resources :matches
  resources :posts
  
  root "posts#index"
end
