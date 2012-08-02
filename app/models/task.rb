class Task < ActiveRecord::Base
  attr_accessible :body, :completed_at, :deleted_at, :due_date, :list_id, :user_id

  belongs_to :list
  belongs_to :user
end
