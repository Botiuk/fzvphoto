class Tournament < ApplicationRecord
    has_many :matches, dependent: :destroy

    validates :name, presence: true

    def self.formhelper
        Tournament.order(:name).pluck(:name, :id)
    end
end
