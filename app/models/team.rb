# frozen_string_literal: true

class Team < ApplicationRecord
  has_one_attached :teamlogo
  has_rich_text :teaminfo

  has_many :home_team_matches, class_name: 'Match',
                               foreign_key: 'home_team_id',
                               dependent: :destroy,
                               inverse_of: :team
  has_many :visitor_team_matches, class_name: 'Match',
                                  foreign_key: 'visitor_team_id',
                                  dependent: :destroy,
                                  inverse_of: :team

  validates :name, :represent, presence: true

  def self.formhelper
    Team.order(:name).pluck(:name, :id)
  end
end
