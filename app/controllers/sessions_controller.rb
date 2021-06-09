class SessionsController < ApplicationController

  def new
  end

  def create
    if User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
      @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Incorrect username or password"
      redirect_to '/login'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
