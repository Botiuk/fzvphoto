class Stadium < ApplicationRecord
    belongs_to :location
    has_many :matches
    has_many :post_about_stadia
    has_rich_text :stadiuminfo

    validates :name, presence: true

    def self.formhelper
        Stadium.order(:name).pluck(:name, :id)
    end
end
