class IssuesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_issue, only: [:edit, :update, :destroy]

  def index
    @issues = Issue.all
    @solved_count = Issue.count(:solved)
  end

  def new
    @issue = Issue.new
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.user = current_user
    @issue.event = Event.where(active: true).last

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
        format.json { render :index, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:title, :description, :solved, :event_id, :user_id)
    end
end
