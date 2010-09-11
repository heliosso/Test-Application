class UserTasksController < ApplicationController
  
  # To get list of tasks corresponding to a tasklist assigned to an user
  def list
    @page_title = "User Task Status"
    @user = User.find(params[:user_id])
    @task_list = TaskList.find(params[:task_list])
    @tasks = Task.find_with(@task_list)
  end
  
  # To change the status of the task
  def change_task_status
    @task_status = UserTask.update_task_status(params[:user_id],params[:task_id])
  end
  
end
