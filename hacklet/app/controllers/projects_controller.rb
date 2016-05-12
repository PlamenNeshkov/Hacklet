class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :submit, :update]

  def index
    @projects = Project.all.where(submitted: true)
  end

  def show
  end

  def submit
  end

  def update
    respond_to do |format|
      merged_params = project_params.merge(submitted: true)
      if @project.update(merged_params)
        format.html { redirect_to @project, notice: 'Project was successfully submit.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #  @project.destroy
  #  respond_to do |format|
  #    format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  # end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:repository_url, :image)
    end
end
