class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @task = Task.new
    @tasks = Task.where(user: @user)

    respond_to do |format|
      format.html
      format.json { render :json => @tasks.to_json }
    end

  end

  def create
    @user = User.find(params[:user_id])
    @task = Task.create(user: @user, content: params[:task][:content], completed: false)
    redirect_to root_path
  end

  def update
    @task = Task.find(params[:id])
    new_status = !@task.completed
    @task.update(completed: new_status)
    redirect_to root_path
  end

  def destroy
    @task = Task.find_by(id:params[:id])
    p "to destroy: #{@task}"
    Task.destroy(@task.id)
    redirect_to root_path
  end

end
