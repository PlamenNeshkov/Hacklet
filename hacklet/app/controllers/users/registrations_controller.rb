class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:settings]
  before_action :set_user, only: [:profile, :projects, :settings]

  def new
    @token = params[:invite_token]
    super
  end

  def create
    @token = params[:invite_token]
    if @token != nil
      super do
        team = Invite.find_by_token(@token).team
        team.members << resource
        team.save
      end
    else
      super
    end
  end

  def update
    super
  end

  def destroy
    super
  end

  def cancel
    super
  end

  def profile
    @teams = Team
      .includes(:participations)
      .where('teams.captain_id = ? OR participations.user_id = ?',
              current_user.id, current_user.id)
      .references(:participations)
  end

  def projects
  end

  def settings
  end

  protected
    def after_sign_up_path_for(resource)
      super(resource)
    end

    def after_inactive_sign_up_path_for(resource)
      super(resource)
    end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
