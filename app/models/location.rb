class Location < ApplicationRecord
    has_many :post

    validates :country, presence: true
    validates :loctype, presence: true
    validates :name, presence: true

    enum :loctype, { city: 0, town: 1, village: 2 }, prefix: true

end
