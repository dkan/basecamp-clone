class TasksController < ApplicationController

  def create
    @task = Task.new(params[:task])
      if @task.save
        flash[:success] = "More work created!"
        redirect_to project_path(@task.list.project_id)
      else
        flash[:error] = "No go!"
        render 'list/show'
      end
  end


end
