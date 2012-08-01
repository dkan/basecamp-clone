class ProjectsController < ApplicationController

  def new
    @user = current_user
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.new(params[:project])

    if @project.save
      flash[:message] = "Huzzah! Your project was created."
      redirect_to user_projects_path
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
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])
  end

end
