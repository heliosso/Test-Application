class CreateTaskStatuses < ActiveRecord::Migration
  def self.up
    create_table :task_statuses do |t|
      t.string :task_list
      t.string :title
      t.string :description
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :task_statuses
  end
end
