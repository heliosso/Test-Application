class AddDuedateToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :due_date, :date
  end

  def self.down
    remove_column :tasks, :due_date
  end
end
