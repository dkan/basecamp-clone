class ListsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @list = @project.lists.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      flash[:message] = "Good job creating a list."
      redirect_to project_path(@list.project_id)
    else
      flash[:message] = "Bad job."
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
    @task = @list.tasks.new
  end
end
