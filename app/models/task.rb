class Task < ActiveRecord::Base
  belongs_to :task_list
  has_many :user_tasks, :dependent => :destroy
  has_many :users, :through => :user_tasks
  
  named_scope :find_with, lambda {|task_list| {:conditions => ['task_list_id = ?', task_list.id]} }
end
