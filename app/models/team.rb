class Team < ApplicationRecord
    has_many :home_team_matches, class_name: 'Match', foreign_key: 'home_team_id'
    has_many :visitor_team_matches, class_name: 'Match', foreign_key: 'visitor_team_id'

    validates :name, presence: true
    validates :represent, presence: true

    def self.formhelper
        Team.order(:name).pluck(:name, :id)
    end
end
