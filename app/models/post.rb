class Post < ApplicationRecord
    has_rich_text :content

    belongs_to :location
    has_one :match

    validates :title, presence: true
    validates :content, presence: true

    def self.search_location(location_id)
        Post.where(location_id: location_id).order(:postdate,:id).reverse_order
    end

    def self.search(posts_id)
        Post.where(id: posts_id).order(:postdate,:id).reverse_order
    end

    def self.formhelper
        Post.order(:postdate).reverse_order.pluck(:title, :id)
    end

end
