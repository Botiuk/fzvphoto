class Stadium < ApplicationRecord
    belongs_to :location
    has_many :matches

    validates :name, presence: true

    def self.formhelper
        Stadium.order(:name).pluck(:name, :id)
    end
end
