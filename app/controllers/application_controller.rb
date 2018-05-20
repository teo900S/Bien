class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any page load find current user_id
  before_action :find_current_user

  # add in the method to use in the views
  helper_method :is_logged_in?


  def find_current_user
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  # check log in status
  def check_login
    unless is_logged_in?
      # all good
      direct_to new_session_path
    end
  end

  #is the person logged in
  def is_logged_in?
    session[:user_id].present?
  end


end
