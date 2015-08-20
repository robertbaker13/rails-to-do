class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.all.sort
  end

  def create
    @task = Task.create(content: params[:task][:content], completed: false)
    redirect_to root_path
  end

  def update
    p "updates"
    @task = Task.find(params[:id])
    new_status = !@task.completed
    @task.update(completed: new_status)
    redirect_to root_path
  end

  def destroy
    p "destruction"
    @task = Task.find(params[:id])
    Task.destroy(@task)
    redirect_to root_path
  end

end
