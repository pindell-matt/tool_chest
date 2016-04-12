class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      # flag
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :username,
                                 :password)
  end
end
