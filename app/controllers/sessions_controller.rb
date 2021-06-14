class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to current_user
    end 
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

  def create_from_facebook
    @user = User.find_or_create_by(username: auth['info']['email']) do |u|
      if !u.password
        u.password = SecureRandom.hex(8)
      end
    end
    session[:user_id] = @user.id
    redirect_to @user
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
