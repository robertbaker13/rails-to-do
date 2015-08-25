class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # assumes whoever is creating user is also logging in as said user

    if User.find_by(username: user_params[:username])
      flash.now.alert = "That username is taken"
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now.alert = "Invalid username or password"
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash.now.alert = "Invalid data"
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])

    if session[:user_id] != @user.id
      redirect_to users_path
    else
      @user.destroy
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
