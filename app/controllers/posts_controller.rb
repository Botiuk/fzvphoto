class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show typeposts ]
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @pagy, @posts = pagy(Post.all.order(:postdate, :id).reverse_order, items: 9)
  rescue Pagy::OverflowError
    redirect_to posts_url(page: 1)
  end

  def show
  end

  def new
    @post = Post.new
    @locations = Location.formhelper
  end

  def edit
    @locations = Location.formhelper
  end

  def create
    @post = Post.new(post_params)
    @locations = Location.formhelper
    if @post.save
      redirect_to posts_url, notice: t('notice.create.post')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: t('notice.update.post')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: t('notice.destroy.post')
  end

  def typeposts
    posts = Post.search_type(params[:posttype])
    @count = posts.size
    @pagy, @posts = pagy(posts, items: 9)
    @posttype = params[:posttype]
  rescue Pagy::OverflowError
    redirect_to locations_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to posts_url
  end

  def post_params
    params.require(:post).permit(:title, :location_id, :content, :postdate, :spoiler, :posttype)
  end

  def authenticate_user!
    redirect_to posts_url unless user_signed_in?
  end
end
