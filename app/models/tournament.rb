class Tournament < ApplicationRecord
    has_many :matches
    
    validates :name, presence: true

    def self.formhelper
        Tournament.order(:name).pluck(:name, :id)
    end
end
