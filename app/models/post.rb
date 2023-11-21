class Post < ApplicationRecord
    belongs_to :location

    validates :title, presence: true

end
