class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_url(user), :notice => "Thank you for logging in."
    else
      redirect_to new_sessions_url :notice => "Please try again"
    end
  end

  def destroy
    reset_session
    redirect_to users_url, :notice => "You have successfully logged out."
  end

end
