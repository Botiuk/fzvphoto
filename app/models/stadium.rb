class Stadium < ApplicationRecord

    validates :name, presence: true
    validates :location_id, presence: true
end
