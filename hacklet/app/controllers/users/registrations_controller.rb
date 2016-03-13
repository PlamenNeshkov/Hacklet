class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @token = params[:invite_token]
    super
  end

  def create
    @token = params[:invite_token]
    if @token != nil
      super do
        team = Invite.find_by_token(@token).team
        @resource.teams.push(team)
        @resource.save
      end
    else
      super
    end
  end

  def edit
    super
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

  protected
  def after_sign_up_path_for(resource)
    super(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
