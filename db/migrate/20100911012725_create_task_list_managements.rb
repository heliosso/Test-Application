class CreateTaskListManagements < ActiveRecord::Migration
  def self.up
    create_table :task_list_managements do |t|
      t.integer :user_id
      t.integer :task_list_id
      t.timestamps
    end
  end

  def self.down
    drop_table :task_list_managements
  end
end
