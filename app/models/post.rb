class Post < ApplicationRecord
    has_one_attached :spoiler
    has_rich_text :content
    
    belongs_to :location
    has_one :match
    has_one :stadium_post

    validates :title, presence: true
    validates :content, presence: true

    enum :posttype, { football: 0, stadium: 1, hockey: 2, rugby: 3, karting: 4, other: 5 }, prefix: true

    def self.formhelper(posttype)
        Post.where(posttype: posttype).order(:postdate).reverse_order.limit(10).pluck(:title, :id)
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

    def self.search_type(posttype)
        Post.where(posttype: posttype).order(:postdate,:id).reverse_order
    end

end
