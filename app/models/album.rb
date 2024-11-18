# frozen_string_literal: true

class Album < ApplicationRecord
  belongs_to :post
  has_one :match, through: :post
  has_many_attached :photos

  def self.formhelper_posts
    Album.pluck(:post_id)
  end

  def self.search_location(location_id)
    Album.joins(:post).where(post: { location_id: location_id }).order(:id).reverse_order
  end

  def self.search_album_id(post_id)
    Album.where(post_id: post_id).pluck(:id)
  end

  def self.search_by_post(posts_id)
    Album.where(post_id: posts_id).order(:id).reverse_order
  end

  def self.search_team(team_id)
    Album.joins(:match).where(match: { home_team_id: team_id })
         .or(Album.joins(:match).where(match: { visitor_team_id: team_id }))
         .order(:id).reverse_order
  end

  def self.search_tournament(tournament_id)
    Album.joins(:match).where(match: { tournament_id: tournament_id }).order(:id).reverse_order
  end

  def self.search_stadium(stadium_id)
    posts_id = Post.search_stadium(stadium_id).pluck(:id)
    Album.search_by_post(posts_id)
  end
end
