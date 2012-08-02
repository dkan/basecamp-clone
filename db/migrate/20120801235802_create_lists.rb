class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.string :description

      t.timestamps
    end
  end
end
