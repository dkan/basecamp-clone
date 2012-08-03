class MembershipsController < ApplicationController
  def new
    @membership = Membership.new
    @project = Project.find(params[:id])
    respond_to do |format|
      format.js {render :action => 'new'}
    end
  end

  def create
    if @user = User.find_by_email(params[:membership][:user_id]) #actually, this is the email

      admin = false
      if params[:membership][:admin] == 1
        admin = true
      end
      @membership  = @user.memberships.new
      @membership.admin = admin
      @membership.user_id = @user.id
      @membership.project_id = params[:membership][:project_id]

      if @membership.save
        flash[:success] = "You didn't screw up, jerk"

      else
        flash[:error] = "What are you doing?!"
      end

    else
      flash[:error] = "Enter valid email, dummy"
    end
    redirect_to :back

  end
end
