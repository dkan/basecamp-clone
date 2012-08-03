class Project < ActiveRecord::Base
  attr_accessible :access, :name, :user_id, :description

  has_many :memberships
  has_many :users, :through => :memberships
  has_many :lists

  validates_presence_of :name, :description


end

