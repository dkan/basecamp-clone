require 'spec_helper.rb'

describe User do
  it "saves with email, password, and password_confirmation" do
    @user = User.create(:email => "chad@fun.org", :password => 'foobar', :password_confirmation => 'foobar')
    @user.save.should eq true
  end

  it "fails to save if no email is provided" do
    @user = User.create(:email => "", :password => 'foobar', :password_confirmation => 'foobar')
    @user.save.should eq false
  end

end