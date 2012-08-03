class Membership < ActiveRecord::Base
  attr_accessible :admin?, :project_id, :user_id
  belongs_to :user
  belongs_to :project
end
