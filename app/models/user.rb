class User < ActiveRecord::Base
  has_many :task_lists, :dependent => :destroy
  
  accepts_nested_attributes_for :task_lists
end
