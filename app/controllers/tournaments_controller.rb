class TournamentsController < ApplicationController    
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_tournament, only: %i[ show edit update destroy ]

  def index
    @tournaments = Tornament.all.order(:name)
  end

  def show
  end

  def new
    @tournament = Tornament.new
  end

  def edit
  end

  def create
    @tournament = Tornament.new(tournament_params)
    if @tournament.save
      redirect_to tournament_url(@tournament), notice: t('notice.create.tournament')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournament_url(@tournament), notice: t('notice.update.tournament')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: t('notice.destroy.tournament')
  end

  private

  def set_tournament
    @tournament = Tornament.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def tournament_params
    params.require(:tournament).permit(:name, :subname, :group)
  end

  def authenticate_user!
    redirect_to tournaments_url unless user_signed_in?
  end

end
