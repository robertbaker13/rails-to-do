module Api
  module V1
    class TasksController < ApplicationController
      protect_from_forgery with: :null_session
      respond_to :json

      def index
        respond_with Task.all
      end

      def create
        task = Task.create(params[:task])
        p "task: #{task}"
        if task
          render json: task
        else
          respond_with Task.all
        end
      end

      def update
        task = Task.update(current_user.id, params[:task])
        render json: task
      end

      def destroy
        Task.destroy(params[:id])
        respond_with Task.all
      end
    end
  end
end