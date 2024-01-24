class StadiumPostsController < ApplicationController
    before_action :authenticate_user!, except: %i[ searchposts searchalbums ]
    before_action :set_stadium_post, only: %i[ show edit update destroy ]
    before_action :my_formhelpers, only: %i[ new edit create ]

  def index
    @pagy, @stadium_posts = pagy(StadiumPost.all, items: 9)
  rescue Pagy::OverflowError
    redirect_to stadium_posts_url(page: 1)
  end

  def show
    redirect_to stadium_posts_url
  end

  def new
    @stadium_post = StadiumPost.new
  end

  def edit
  end

  def create
    @stadium_post = StadiumPost.new(stadium_post_params)
    if @stadium_post.save
      redirect_to stadium_posts_url, notice: t('notice.create.stadium_post')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stadium_post.update(stadium_post_params)
      redirect_to stadium_posts_url, notice: t('notice.update.stadium_post')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stadium_post.destroy
    redirect_to stadium_posts_url, notice: t('notice.destroy.stadium_post')
  end

  def searchposts
    posts = Post.search_stadium_post(params[:id])
    @count = posts.size
    @pagy, @posts = pagy(posts, items: 9)
    @stadium = Stadium.find(params[:id])
  rescue
    redirect_to stadia_path
  end

  def searchalbums
    albums = Album.search_stadium_album(params[:id])
    @count = albums.size
    @pagy, @posts = pagy(albums, items: 9)
    @stadium = Stadium.find(params[:id])
  rescue
    redirect_to stadia_path
  end

  private

  def set_stadium_post
    @stadium_post = StadiumPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to stadium_posts_url
  end

  def stadium_post_params
    params.require(:stadium_post).permit(:stadium_id, :post_id)
  end

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end

  def my_formhelpers
    @stadia = Stadium.formhelper
    @posts = Post.formhelper("stadium")
  end
end
