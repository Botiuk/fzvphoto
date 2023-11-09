class Location < ApplicationRecord
    has_many :post
    has_many :stadium

    validates :country, presence: true
    validates :loctype, presence: true
    validates :name, presence: true

    enum :loctype, { city: 0, town: 1, village: 2 }, prefix: true

    def self.formhelper
        Location.order(:name).pluck(:name, :id)
    end

end
