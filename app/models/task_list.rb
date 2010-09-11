class TaskList < ActiveRecord::Base
  
  has_many :tasks, :dependent => :destroy
  has_many :task_list_managements, :dependent => :destroy
  has_many :users, :through =>:task_list_managements
  
  named_scope :assigned_task_list, lambda{|user| {:include => :task_list_managements, :conditions => ["task_list_managements.user_id = ?", user.id]}}
  
  # To get unassigned task list for an user
  def self.unassigned_task_list(user)
     sql = "SELECT * FROM task_lists WHERE id not in (select task_list_id from task_list_managements where user_id = #{user.id})"
     @task_list  = TaskList.find_by_sql(sql)
   end
end
