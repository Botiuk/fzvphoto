class Post < ApplicationRecord
    has_one_attached :spoiler do |attachable|
        attachable.variant :thumb, resize_to_limit: [150, 150]
    end
    has_rich_text :content
    
    belongs_to :location
    has_one :match
    has_one :stadium_post

    validates :title, presence: true
    validates :content, presence: true

    def self.formhelper
        Post.order(:postdate).reverse_order.limit(6).pluck(:title, :id)
    end

    def self.search_location(location_id)
        Post.where(location_id: location_id).order(:postdate,:id).reverse_order
    end

    def self.search_team(team_id)
        Post.joins(:match).where(match: {home_team_id: team_id}).or(Post.joins(:match).where(match: {visitor_team_id: team_id})).order(:postdate,:id).reverse_order
    end

    def self.search_tournament(tournament_id)
        Post.joins(:match).where(match: {tournament_id: tournament_id}).order(:postdate,:id).reverse_order
    end

    def self.search_stadium(stadium_id)
        Post.joins(:match).where(match: {stadium_id: stadium_id}).order(:postdate,:id).reverse_order
    end

    def self.search_stadium_post(stadium_id)
        Post.joins(:stadium_post).where(stadium_post: {stadium_id: stadium_id}).order(:postdate,:id).reverse_order
    end

end
