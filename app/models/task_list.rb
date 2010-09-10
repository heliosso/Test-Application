class TaskList < ActiveRecord::Base
  belongs_to :user
  
  named_scope :assigned_to_user, lambda {|user| {:conditions => ["task_lists.user_id = ?", user.id]}}
    
end
