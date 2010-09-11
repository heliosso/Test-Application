# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  # To format datetime
  def datetime_in_words(date_time)
    sprintf(date_time.strftime("%a ") +date_time.strftime("%b ") + date_time.strftime("%d").to_i.to_s + date_time.strftime(", %Y"))
  end
  
  
  # To find user task status
  def task_status?(user_id,task_id)
    task_status = UserTask.find_with_task_and_user(task_id, user_id)
    if task_status and task_status.status.to_i != 0
      return true
    else
      return false
    end
  end
  
  # Remarks on task completion
  def comments(user_id, task_id, due_date)
    user_task = UserTask.find_with_task_and_user(task_id, user_id)
    completed_on = user_task.present? ? (user_task.completed_on.present? ? user_task.completed_on : nil) : nil
    if completed_on && due_date == completed_on
     comments = "Completed on time"
    elsif completed_on && due_date < completed_on
     comments =  "Task completed before due date"
    elsif completed_on && due_date > completed_on
     comments = "Task is completed after due date"
    elsif completed_on.nil? && due_date == Date.today
      "Today is the last day of due date to complete the task"
    elsif completed_on.nil? && due_date > Date.today
     comments = "Task to be completed on '#{datetime_in_words(due_date)}'"
    elsif completed_on.nil? && due_date < Date.today
     comments = "Task due date is overdued"
    else
      comments = ""   
    end
    comments
  end
end
