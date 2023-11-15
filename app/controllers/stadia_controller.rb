class StadiaController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_stadium, only: %i[ show edit update destroy ]

  def index
    @stadia = Stadium.all.order(:name)
  end

  def show
    redirect_to stadia_url
  end

  def new
    @stadium = Stadium.new
    @locations = Location.formhelper
  end

  def edit
    @locations = Location.formhelper
  end

  def create
    @stadium = Stadium.new(stadium_params)
    @locations = Location.formhelper
    if @stadium.save
      redirect_to stadia_url, notice: t('notice.create.stadium')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @stadium.update(stadium_params)
      redirect_to stadia_url, notice: t('notice.update.stadium')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @stadium.destroy
    redirect_to stadia_url, notice: t('notice.destroy.stadium')
  end

  private

  def set_stadium
    @stadium = Stadium.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def stadium_params
    params.require(:stadium).permit(:name, :street, :location_id)
  end

  def authenticate_user!
    redirect_to stadia_url unless user_signed_in?
  end
end
