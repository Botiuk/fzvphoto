# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: %i[show edit update destroy]
  before_action :my_formhelpers, only: %i[new edit create]

  def index
    @pagy, @matches = pagy(Match.order(:id).reverse_order, items: 9)
  rescue Pagy::OverflowError
    redirect_to matches_url(page: 1)
  end

  def show
    redirect_to matches_url
  end

  def new
    @match = Match.new
    @posts = Post.formhelper_match_new
  end

  def edit
    @posts = Post.formhelper_match_edit(@match)
  end

  def create
    @match = Match.new(match_params)
    @posts = Post.formhelper_match_new
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
    redirect_to matches_url
  end

  def match_params
    params.require(:match).permit(:home_team_id, :visitor_team_id, :home_team_goal, :visitor_team_goal, :tournament_id,
                                  :stadium_id, :stage, :post_id)
  end

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end

  def my_formhelpers
    @teams = Team.formhelper
    @tournaments = Tournament.formhelper
    @stadia = Stadium.formhelper
  end
end
