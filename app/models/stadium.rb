class Stadium < ApplicationRecord
    belongs_to :location
    has_many :matches

    validates :name, presence: true
    validates :location_id, presence: true
end
