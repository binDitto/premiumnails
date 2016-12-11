class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome aboard"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Sign in failed"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You have logged out"
    redirect_to users_path
  end

end
