class ListsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @list = @project.lists.new
    respond_to do |format|
      format.js {render :action => 'new'}
    end
  end

  def create
    @list = List.new(params[:list])
    @project = Project.find(@list.project_id)
    respond_to do |format|
      if @list.save
        flash[:message] = "Good job creating a list."
        # redirect_to project_path(@list.project_id)
        format.js {render :action => 'restore'}
      else
        flash[:message] = "Bad job."
        render :new
      end
    end

  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end
end
