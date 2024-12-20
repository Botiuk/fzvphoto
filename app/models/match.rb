# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'
  belongs_to :tournament
  belongs_to :stadium
  belongs_to :post

  def self.formhelper_posts
    Match.pluck(:post_id)
  end

  def self.search_stadium(stadium_id)
    Match.where(stadium_id: stadium_id).pluck(:post_id)
  end
end
