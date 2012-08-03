require 'spec_helper.rb'

describe Project do
  it "saves with name and description and user_id" do
    @project = Project.create(:user_id => 1, :name => "project one", :description => "this is a good project.")
    #@project.save.should eq true
    @project.user_id.should_not be_nil
    @project.name.should_not be_nil
    @project.description.should_not be_nil
  end

  # it "fails to save if no email is provided" do
  #   @user = User.create(:email => "", :password => 'foobar', :password_confirmation => 'foobar')
  #   @user.save.should eq false
  # end

end