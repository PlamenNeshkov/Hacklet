class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :latest_posts

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

  # Checks that the current user has permission to access the current action.
  #   This method may redirect if you prefer.
  #
  # Returns true if the user (Blogger) is permitted
  # Returns false if the user (Blogger) is not permitted
  def authenticate_blogger
    #current_user.admin?
    true
  end

  # The sign out URL to leave the admin dashboard
  #
  # Returns a String with a URL path that your application must recognised with a DELETE HTTP request
  def blogit_admin_sign_out_url
    destroy_user_session_url
  end

  # The currently signed in Blogger.
  # Must be an instance of an ActiveRecord::Base model that blogs
  # Returns an ActiveRecord::Base subclass instance
  def current_blogger
    current_user
  end

  def latest_posts
    Blogit::Post.last(3)
  end
end
