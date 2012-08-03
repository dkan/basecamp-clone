class ProjectsController < ApplicationController

  def new
    @user = current_user
    @project = @user.projects.new
  end

  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:message] = "Huzzah! Your project was created."
      @membership = @project.memberships.create(:user_id => current_user.id, :admin => true )
      redirect_to root_path#projects_path(:user_id => @project.user_id)
    else
      flash[:error] = "You screwed up big time, loser."
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @memberships = @user.memberships.all
  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id)
  end

end
