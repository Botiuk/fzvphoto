class Post < ApplicationRecord
    has_one_attached :spoiler
    has_rich_text :content
    
    belongs_to :location
    has_one :match
    has_one :album

    validates :title, presence: true
    validates :content, presence: true

    enum :posttype, { football: 0, stadium: 1, hockey: 2, rugby: 3, karting: 4, other: 5 }, prefix: true

    def self.formhelper(posttype)
        Post.where(posttype: posttype).order(:postdate).reverse_order.limit(10).pluck(:title, :id)
    end
   
    def self.formhelper_album_new
        posts_id = Album.formhelper_posts
        Post.where.not(id: posts_id ).pluck(:title, :id)
    end

    def self.formhelper_album_edit(album)
        Post.where(id: album.post_id ).pluck(:title, :id) + Post.formhelper_albums_new
    end
    
    def self.formhelper_match_new
        posts_id = Match.formhelper_posts
        posts_free_id = Post.where.not(id: posts_id ).pluck(:id)
        Post.where(id: posts_free_id, posttype: "football" ).pluck(:title, :id)
    end

    def self.formhelper_match_edit(match)
        Post.where(id: match.post_id ).pluck(:title, :id) + Post.formhelper_match_new
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

    def self.search_type(posttype)
        Post.where(posttype: posttype).order(:postdate,:id).reverse_order
    end

end
