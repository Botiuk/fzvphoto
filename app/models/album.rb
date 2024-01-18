class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :photos

  def self.search_location(location_id)
    Album.joins(:post).where(post: {location_id: location_id}).order(:id).reverse_order
  end

end
