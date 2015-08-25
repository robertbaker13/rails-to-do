class ApiController < ApplicationController
  def documentation
    render json: "documentation"
  end

  def tasks
    @tasks = Task.all
    render json: @tasks
  end
end
