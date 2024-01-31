class PostAboutStadium < ApplicationRecord
  belongs_to :post
  belongs_to :stadium

  def self.formhelper_posts
    PostAboutStadium.all.pluck(:post_id)
  end

  def self.search_stadium(stadium_id)
    PostAboutStadium.where(stadium_id: stadium_id).pluck(:post_id)
  end

end
