class Stadium < ApplicationRecord
    belongs_to :location

    validates :name, presence: true
    validates :location_id, presence: true
end
