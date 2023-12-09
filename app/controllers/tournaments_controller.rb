class TournamentsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_tournament, only: %i[ show edit update destroy searchposts ]

  def index
    @pagy, @tournaments = pagy(Tournament.all.order(:name, :subname, :group), items: 6)
  rescue Pagy::OverflowError
    redirect_to tournaments_url(page: 1)
  end

  def show
    redirect_to tournaments_url
  end

  def new
    @tournament = Tournament.new
  end

  def edit
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to tournaments_url, notice: t('notice.create.tournament')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to tournaments_url, notice: t('notice.update.tournament')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: t('notice.destroy.tournament')
  end

  def searchposts    
    @pagy, @posts = pagy(Post.search_tournament(params[:id]), items: 6)
  rescue Pagy::OverflowError
    redirect_to tournaments_url(page: 1)
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
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
