class MentorsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @mentors = Mentor.all
  end

  def show
  end

  def new
    # NOT ENOUGH NESTED IF STATEMENTS, SORRY
    @mentor = Mentor.new

    @step = Array.new
    @ready = false
    @pending = true

    @step[1] = 'active'
    @step[2] = 'disabled'
    @step[3] = 'disabled'
    @step[4] = 'disabled'

    if current_user
      @step[1] = 'complete'
      @step[2] = 'active'

      if Mentor.find_by(user_id: current_user.id).nil?
        @pending = false
      end

      if current_user.about_text != ''
        @step[2] = 'complete'

        if current_user.site_url != '' || current_user.facebook_url != '' || current_user.twitter_url != ''
          @step[3] = 'complete'
          @ready = true
        end
      end
    end

    @events = Event.where('start > (?)', Time.now)
  end

  def edit
  end

  def create
    @mentor = Mentor.new
    @mentor.approved = false
    @mentor.user_id = current_user.id
    @mentor.event_id = params[:mentor][:event_id]
    @mentor.save
    flash[:info] = 'Your application has been submitted.';
    redirect_to root_url
  end

  def update
  end

  def destroy
  end

  private
    def mentor_params
      params
          .require(:mentor)
          .permit(:user_id, :approved, :event_id)
    end
end
