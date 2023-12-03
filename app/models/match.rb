class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :tournament
  belongs_to :stadium
  belongs_to :post

  def self.search_team(team_id)
    Match.where(home_team_id: team_id).or(Match.where(visitor_team_id: team_id)).pluck(:post_id)
  end

end
