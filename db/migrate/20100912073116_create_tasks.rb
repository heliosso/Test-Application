class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :task_list_id
      t.string :title
      t.text :description
      t.date :due_date
      t.boolean :status, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
