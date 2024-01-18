class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :photos
  
  def self.formhelper_posts
    Album.all.pluck(:post_id)
  end

  def self.search_location(location_id)
    Album.joins(:post).where(post: {location_id: location_id}).order(:id).reverse_order
  end

  def self.search_team(team_id)
    posts_id = Post.search_team(team_id).pluck(:id)
    Album.where(post_id: posts_id).order(:id).reverse_order
  end

end
