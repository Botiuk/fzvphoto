class Post < ApplicationRecord
    belongs_to :location

    validates :title, presence: true
    validates :body, presence: true

end
