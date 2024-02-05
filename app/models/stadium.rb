class Stadium < ApplicationRecord
    has_rich_text :stadiuminfo

    belongs_to :location
    has_many :matches, dependent: :destroy
    has_many :post_about_stadia, dependent: :destroy

    validates :name, presence: true

    def self.formhelper
        Stadium.order(:name).pluck(:name, :id)
    end
end
