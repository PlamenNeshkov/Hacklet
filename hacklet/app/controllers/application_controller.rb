class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def assert_admin
    unless current_user
      flash[:notice] = 'You must login before proceeding'
      redirect_to new_user_session_url
    end

    unless current_user.admin?
      flash[:error] = 'You must be an admin to do this'
      redirect_to '/'
    end
  end
end
