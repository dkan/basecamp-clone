class TasksController < ApplicationController

  def new
    @list = List.find(params[:id])
    @task = @list.tasks.new
    respond_to do |format|
      format.js {render :action => 'new'}
    end
  end

  def create
    @task = Task.new(params[:task])
    @list = @task.list
    # @list = List.find(params[:task][:list_id])
    respond_to do |format|

      if @task.save
        flash[:success] = "More work created!"
        # redirect_to project_path(@task.list.project_id)
        format.js {render :action => 'restore'}
      else
        flash[:error] = "No go!"
        render 'list/show'
      end
    end
  end


end
