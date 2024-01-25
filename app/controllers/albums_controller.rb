class AlbumsController < ApplicationController
    before_action :authenticate_user!, except: %i[ index show ]
    before_action :set_album, only: %i[ show edit update destroy ]

    def index
      @pagy, @albums = pagy(Album.all.order(:id).reverse_order, items: 9)
    rescue Pagy::OverflowError
      redirect_to albums_url(page: 1)
    end

    def show
    end

    def new
      @album = Album.new
      @posts = Post.formhelper_album_new
    end

    def edit
      @posts = Post.formhelper_album_edit(@album)
    end

    def create
      @album = Album.new(album_params)
      @posts = Post.formhelper_album_new
      if @album.save
        redirect_to albums_url, notice: t('notice.create.album')
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @album.update(album_params)
        redirect_to album_url(@album), notice: t('notice.update.album')
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @album.destroy
      redirect_to albums_url, notice: t('notice.destroy.album')
    end

    private

    def set_album
      @album= Album.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to albums_url
    end

    def album_params
      params.require(:album).permit(:post_id, photos: [])
    end

    def authenticate_user!
      redirect_to albums_url unless user_signed_in?
    end
end
