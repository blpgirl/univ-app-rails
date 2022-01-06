class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_user

  helper_method :current_user, :logged_in?

  def current_user
    # || to perform the query only if the current_user doesn't exist yet so it doesn't call db every time
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    # to make the method return true or false set !!
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice]= "You must be log in to perform that action."
      redirect_to login_path
    end
  end
end
