class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # helper_method :current_user

  private

  def current_user
   @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def login(user)
   session[:user_id] = user.id
  end

  def logout!
   session[:user_id] = nil
  end

  def find_user
   @user ||= User.find_by(username: params[:username])
  end

  def bounce
    if current_user
      redirect_to user_tasks_path(current_user)
    else
      redirect_to login_path
    end
  end
end
