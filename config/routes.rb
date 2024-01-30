Rails.application.routes.draw do
  devise_for :users

  get 'locations/searchposts', to: 'locations#searchposts'
  get 'teams/searchposts', to: 'teams#searchposts'
  get 'tournaments/searchposts', to: 'tournaments#searchposts'
  get 'stadia/searchposts', to: 'stadia#searchposts'

  get 'locations/searchalbums', to: 'locations#searchalbums'
  get 'teams/searchalbums', to: 'teams#searchalbums'
  get 'tournaments/searchalbums', to: 'tournaments#searchalbums'
  get 'stadia/searchalbums', to: 'stadia#searchalbums'

  get 'posts/typeposts', to: 'posts#typeposts'
  get 'albums/typealbums', to: 'albums#typealbums'

  resources :locations, :teams, :tournaments, :stadia, :matches, :posts, :albums, :post_about_stadia

  root "posts#index"
end
