module Api
  module V1
    class TasksController < ApplicationController
      respond_to :json

      def index
        respond_with Task.all
      end

      def create
        respond_with Task.create(params[:product])
      end

      def update
        respond_with Task.update(params[:id], params[:products])
      end

      def destroy
        respond_with Task.destroy(params[:id])
      end
    end
  end
end