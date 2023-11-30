class TeamsController < ApplicationController
    before_action :authenticate_user!, except: %i[index show]
    before_action :set_team, only: %i[ show edit update destroy ]

  def index
    @teams = Team.all.order(:name, :represent)
  end

  def show
    redirect_to teams_url
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to teams_url, notice: t('notice.create.team')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @team.update(team_params)
      redirect_to teams_url, notice: t('notice.update.team')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, notice: t('notice.destroy.team')
  end

  private

  def set_team
    @team = Team.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def team_params
    params.require(:team).permit(:name, :represent, :teamtype)
  end

  def authenticate_user!
    redirect_to teams_url unless user_signed_in?
  end

end
