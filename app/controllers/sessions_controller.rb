class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Succsessful Login"
      redirect_to @user # user_path(@user)
    else
      flash[:notice] = "Invalid Login"
      # either user doesn't exist of password is incorrect
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
