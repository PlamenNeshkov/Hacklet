class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team_and_check_captain, only: [:edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    event = Event.find_by(active: true)
    if event == nil
      # TODO: Flash error "there is no active event"
    else
      @team = Team.new
      @team.event_id = event.id
    end
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.captain = current_user
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team,
                      notice: "Team #{@team.name} was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team,
                      notice: "Team #{@team.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url,
                    notice: "Team was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_team_and_check_captain
      team = Team.find(params[:id])
      if team.captain == current_user
        @team = team
      else
        format.html { redirect_to teams_url,
                      notice: "Only the owner of a team can modify it." }
      end
    end

    def team_params
      params
        .require(:team)
        .permit(:name, :event_id, project_attributes: [:id, :name, :description])
    end
end
