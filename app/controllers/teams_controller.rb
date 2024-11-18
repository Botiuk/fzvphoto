# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show searchposts searchalbums]
  before_action :set_team, only: %i[show edit update destroy searchposts searchalbums]

  def index
    @pagy, @teams = pagy(Team.order(:name, :represent), items: 9)
  rescue Pagy::OverflowError
    redirect_to teams_url(page: 1)
  end

  def show; end

  def new
    @team = Team.new
  end

  def edit; end

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

  def searchposts
    posts = Post.search_team(params[:id])
    @count = posts.size
    @pagy, @posts = pagy(posts, items: 9)
  rescue Pagy::OverflowError
    redirect_to teams_url
  end

  def searchalbums
    albums = Album.search_team(params[:id])
    @count = albums.size
    @pagy, @albums = pagy(albums, items: 9)
  rescue Pagy::OverflowError
    redirect_to teams_url
  end

  private

  def set_team
    @team = Team.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to teams_url
  end

  def team_params
    params.require(:team).permit(:name, :represent, :teamtype, :teaminfo, :teamlogo)
  end

  def authenticate_user!
    redirect_to teams_url unless user_signed_in?
  end
end
