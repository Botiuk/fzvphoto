# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show searchposts searchalbums]
  before_action :set_location, only: %i[show edit update destroy searchposts searchalbums]

  def index
    @pagy, @locations = pagy(Location.order(:name, :region, :district), items: 9)
  rescue Pagy::OverflowError
    redirect_to locations_url(page: 1)
  end

  def show; end

  def new
    @location = Location.new
  end

  def edit; end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_url, notice: t('notice.create.location')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      redirect_to locations_url, notice: t('notice.update.location')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_url, notice: t('notice.destroy.location')
  end

  def searchposts
    posts = Post.search_location(params[:id])
    @count = posts.size
    @pagy, @posts = pagy(posts, items: 9)
  rescue Pagy::OverflowError
    redirect_to locations_url
  end

  def searchalbums
    albums = Album.search_location(params[:id])
    @count = albums.size
    @pagy, @albums = pagy(albums, items: 9)
  rescue Pagy::OverflowError
    redirect_to locations_url
  end

  private

  def set_location
    @location = Location.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to locations_url
  end

  def location_params
    params.require(:location).permit(:country, :region, :district, :loctype, :name)
  end

  def authenticate_user!
    redirect_to locations_url unless user_signed_in?
  end
end
