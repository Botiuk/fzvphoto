Rails.application.routes.draw do
  devise_for :users

  get 'locations/searchposts', to: 'locations#searchposts'
  get 'teams/searchposts', to: 'teams#searchposts'
  get 'tournaments/searchposts', to: 'tournaments#searchposts'
  get 'stadia/searchposts', to: 'stadia#searchposts'
  get 'stadium_posts/searchposts', to: 'stadium_posts#searchposts'

  resources :locations
  resources :teams
  resources :tournaments
  resources :stadia
  resources :matches
  resources :posts
  resources :stadium_posts
  
  root "posts#index"
end
