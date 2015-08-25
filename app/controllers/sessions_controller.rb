class SessionsController < ApplicationController
  def login
    if session[:user_id]
      redirect_to "/users/#{session[:user_id]}/tasks/index"
    else
      render "new"
    end
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login
  end
end
