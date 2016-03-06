class Users::ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end

  def create
    super
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super
  end

  protected
  def after_resending_confirmation_instructions_path_for(resource_name)
    super(resource_name)
  end

  def after_confirmation_path_for(resource_name, resource)
    super(resource_name, resource)
  end
end
