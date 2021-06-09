class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  
  def logged_in?
    true if session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

end
