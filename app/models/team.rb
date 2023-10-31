class Team < ApplicationRecord

    validates :name, presence: true
    validates :represent, presence: true
end
