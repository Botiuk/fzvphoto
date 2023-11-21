class Post < ApplicationRecord
    has_rich_text :content

    belongs_to :location

    validates :title, presence: true
    validates :content, presence: true

end
