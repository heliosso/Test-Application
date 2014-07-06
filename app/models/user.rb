class User < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :task_list_managements, :dependent => :destroy
  has_many :task_lists, :through => :task_list_managements
  has_many :user_tasks, :dependent => :destroy
  has_many :tasks, :through => :user_tasks
end
