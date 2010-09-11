class UserTask < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :task
  
  # To update user task status
  def self.update_task_status(user_id,task_id)
    @user_task = UserTask.new
    @user_task.user_id = user_id
    @user_task.task_id = task_id
    @user_task.status = 1
    @user_task.save
    @user_task
  end
end
