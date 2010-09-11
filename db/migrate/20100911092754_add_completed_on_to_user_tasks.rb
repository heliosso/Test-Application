class AddCompletedOnToUserTasks < ActiveRecord::Migration
  def self.up
    add_column :user_tasks, :completed_on, :date
  end

  def self.down
    remove_column :user_tasks, :completed_on
  end
end
