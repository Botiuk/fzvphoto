class Post < ApplicationRecord
    has_rich_text :content

    belongs_to :location

    validates :title, presence: true
    validates :content, presence: true

    def self.search_location(location_id)
        Post.where(location_id: location_id).order(:postdate,:id).reverse_order
    end

end
