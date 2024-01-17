Rails.application.routes.draw do
  devise_for :users

  get 'locations/searchposts', to: 'locations#searchposts'
  get 'teams/searchposts', to: 'teams#searchposts'
  get 'tournaments/searchposts', to: 'tournaments#searchposts'
  get 'stadia/searchposts', to: 'stadia#searchposts'
  get 'stadium_posts/searchposts', to: 'stadium_posts#searchposts'
  get 'posts/typeposts', to: 'posts#typeposts'

  resources :locations, :teams, :tournaments, :stadia, :matches, :posts, :stadium_posts, :albums
  
  root "posts#index"
end
