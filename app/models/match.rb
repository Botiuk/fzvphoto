class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :tournament
  belongs_to :stadium
  belongs_to :post

end
