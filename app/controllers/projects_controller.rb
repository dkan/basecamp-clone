class ProjectsController < ApplicationController

  def new
    @user = current_user
    @project = @user.projects.new
  end

  def create
    # @user = User.find(params[:project][:user_id])
    @project = Project.new(params[:project])

    if @project.save
      flash[:message] = "Huzzah! Your project was created."
      redirect_to projects_path(:user_id => @project.user_id)
    else
      flash[:error] = "You screwed up big time, loser."
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects.all
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id)
  end

end
