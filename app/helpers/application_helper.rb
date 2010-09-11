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
    @task_status = UserTask.find(:first,
                                 :conditions => ["user_id = ? and task_id = ?", user_id,task_id]
                                 )
    if @task_status and @task_status.status.to_i != 0
      return true
    else
      return false
    end
  end
end
