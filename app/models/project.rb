class Project < ActiveRecord::Base
  attr_accessible :access, :name, :user_id, :description

  belongs_to :user

  validates_presence_of :name, :description
end
