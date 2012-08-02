class Project < ActiveRecord::Base
  attr_accessible :access, :name, :user_id, :description

  belongs_to :user
  has_many :lists

  validates_presence_of :name, :description
end
