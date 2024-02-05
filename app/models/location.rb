class Location < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :stadia, dependent: :destroy

    validates :country, presence: true
    validates :loctype, presence: true
    validates :name, presence: true

    enum :loctype, { city: 0, town: 1, village: 2 }, prefix: true

    def self.formhelper
        Location.order(:name).pluck(:name, :id)
    end

end
