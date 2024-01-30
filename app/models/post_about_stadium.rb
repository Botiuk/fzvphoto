class PostAboutStadium < ApplicationRecord
  belongs_to :post
  belongs_to :stadium

  def self.formhelper_posts
    PostAboutStadium.all.pluck(:post_id)
  end
end
