class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]

  def new
    @user = User.new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by :email => params[:email]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['success'] = "You have successfully logged in."
      redirect_to root_path
    else
      flash.now['danger'] = "There is something wrong with your username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are signed out."
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end