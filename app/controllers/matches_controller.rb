class MatchesController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_match, only: %i[ show edit update destroy ]

  def index
    @matches = Match.all.order(:match_date, :id).reverse_order
  end

  def show
    redirect_to matches_url
  end

  def new
    @match = Match.new
    @teams = Team.formhelper
    @tournaments = Tournament.formhelper
    @stadia = Stadium.formhelper
  end

  def edit
    @teams = Team.formhelper
    @tournaments = Tournament.formhelper
    @stadia = Stadium.formhelper
  end

  def create
    @match = Match.new(match_params)
    @teams = Team.formhelper
    @tournaments = Tournament.formhelper
    @stadia = Stadium.formhelper
    if @match.save
      redirect_to matches_url, notice: t('notice.create.match')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @match.update(match_params)
      redirect_to matches_url, notice: t('notice.update.match')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @match.destroy
    redirect_to matches_url, notice: t('notice.destroy.match')
  end

  private

  def set_match
    @match = Match.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def match_params
    params.require(:match).permit(:match_date, :home_team_id, :visitor_team_id, :home_team_goal, :visitor_team_goal, :tournament_id, :stadium_id, :stage)
  end

  def authenticate_user!
    redirect_to matches_url unless user_signed_in?
  end
end
