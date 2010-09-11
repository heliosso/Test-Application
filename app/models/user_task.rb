class UserTask < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :task
  
  def self.find_with_task_and_user(task_id, user_id)
    first(:conditions => ["user_id = ? and task_id = ?", user_id,task_id])
  end
  
  # To update user task status
  def self.update_task_status(user_id,task_id)
    @user_task = UserTask.new
    @user_task.user_id = user_id
    @user_task.task_id = task_id
    @user_task.status = 1
    @user_task.completed_on = Date.today
    @user_task.save
    @user_task
  end
end
