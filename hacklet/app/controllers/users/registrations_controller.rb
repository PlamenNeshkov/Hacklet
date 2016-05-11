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
        recipient = Recipient.find_by_token(@token)
        recipient.accepted = true

        team = recipient.invite.team
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

  def edit
    super
  end

  def avatar
    @user = current_user
  end

  def change_avatar
    respond_to do |format|
      if current_user.update(account_update_params)
        format.html { redirect_to profile_path(current_user),
                      notice: "Your avatar has been changed successfully." }
      else
        format.html { render :avatar }
      end
    end
  end

  protected
    def after_sign_up_path_for(resource)
      super(resource)
    end

    def after_inactive_sign_up_path_for(resource)
      super(resource)
    end

  private
    # TODO: Override sign_up_params too as custom attributes are implemented
    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :about_text, :site_url, :facebook_url, :twitter_url, :avatar)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
