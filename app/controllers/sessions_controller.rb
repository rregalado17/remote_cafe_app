class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new 
    end
  end

  def home
    if current_user
      redirect_to user_path(current_user)
    else
      redirect_to signin_path 
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id 
      redirect_to @user
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil 
    redirect_to signin_url, notice: "Logged out"
  end
end
