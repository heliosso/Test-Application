class TaskListManagement < ActiveRecord::Base
  belongs_to :user
  belongs_to :task_list
  
  # To assign selected tasklist to an user
  def self.assign_task_list(user_id,task_list)
    @assign_task_list = TaskListManagement.new
    @assign_task_list.user_id = user_id
    @assign_task_list.task_list_id = task_list
    @assign_task_list.save
    @assign_task_list
  end
end
