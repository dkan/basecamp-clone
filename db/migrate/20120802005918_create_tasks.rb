class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :body
      t.datetime :completed_at
      t.integer :list_id
      t.datetime :due_date
      t.integer :user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
