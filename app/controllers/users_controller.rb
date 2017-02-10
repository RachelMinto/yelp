class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome, #{@user.first_name}"      
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :location)
  end
end