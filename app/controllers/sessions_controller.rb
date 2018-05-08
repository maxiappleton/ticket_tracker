class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have been logged in!'
      redirect_to root_path
    else
      flash[:alert] = 'Sorry login attempt was not successful'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out!'
    redirect_to root_path
  end
end