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
    @teams = get_teams
    @items = Item.joins(:given_items).where(:given_items => { :user_id => params[:id] })
  end

  def projects
    teams = get_teams.pluck(:id)

    @projects = Project
      .where(team: teams)
      .order(updated_at: :desc)
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
    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation,
          :first_name, :last_name, :gender, :current_password, :about_text,
          :site_url, :facebook_url, :twitter_url, :avatar)
    end

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation,
          :first_name, :last_name, :gender_id)
    end

    def set_user
      @user = User.find(params[:id])
    end

    # TODO: Extract to model?
    def get_teams
      Team
        .includes(:participations)
        .where('teams.captain_id = ? OR participations.user_id = ?',
                    @user.id, @user.id)
        .references(:participations)
    end
end
