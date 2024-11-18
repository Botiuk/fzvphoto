# frozen_string_literal: true

class PostAboutStadiaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post_about_stadium, only: %i[show edit update destroy]

  def index
    @pagy, @post_about_stadia = pagy(PostAboutStadium.all, items: 9)
  rescue Pagy::OverflowError
    redirect_to post_about_stadia_url(page: 1)
  end

  def show
    redirect_to post_about_stadia_url
  end

  def new
    @post_about_stadium = PostAboutStadium.new
    @stadia = Stadium.formhelper
    @posts = Post.formhelper_post_about_stadium_new
  end

  def edit
    @stadia = Stadium.formhelper
    @posts = Post.formhelper_post_about_stadium_edit(@post_about_stadium)
  end

  def create
    @post_about_stadium = PostAboutStadium.new(post_about_stadium_params)
    @stadia = Stadium.formhelper
    @posts = Post.formhelper_post_about_stadium_new
    if @post_about_stadium.save
      redirect_to post_about_stadia_url, notice: t('notice.create.post_about_stadium')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post_about_stadium.update(post_about_stadium_params)
      redirect_to post_about_stadia_url, notice: t('notice.update.post_about_stadium')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post_about_stadium.destroy
    redirect_to post_about_stadia_url, notice: t('notice.destroy.post_about_stadium')
  end

  def searchposts
    posts = Post.search_post_about_stadium(params[:id])
    @count = posts.size
    @pagy, @posts = pagy(posts, items: 9)
    @stadium = Stadium.find(params[:id])
  rescue StandardError
    redirect_to stadia_path
  end

  def searchalbums
    albums = Album.search_stadium_album(params[:id])
    @count = albums.size
    @pagy, @posts = pagy(albums, items: 9)
    @stadium = Stadium.find(params[:id])
  rescue StandardError
    redirect_to stadia_path
  end

  private

  def set_post_about_stadium
    @post_about_stadium = PostAboutStadium.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to post_about_stadia_url
  end

  def post_about_stadium_params
    params.require(:post_about_stadium).permit(:stadium_id, :post_id)
  end

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end
end
