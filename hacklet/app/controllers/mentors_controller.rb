class MentorsController < ApplicationController
  def index
    @mentors = Mentor.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
    def mentor_params
      params
          .require(:mentor)
          .permit(:user_id, :approved)
    end
end
