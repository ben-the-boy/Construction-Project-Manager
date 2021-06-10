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

  def require_login
    redirect_to '/login' unless session.include? :user_id
  end

  def user_match
    if params[:user_id]
      redirect_to '/login' unless current_user.id == params[:user_id].to_i
    else
      redirect_to '/login' unless current_user.id == params[:id].to_i
    end
  end

end
