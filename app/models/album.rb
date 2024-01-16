class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :photos
end
