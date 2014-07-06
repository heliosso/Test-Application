class HooksController < ApplicationController
  protect_from_forgery :except => :task
  
  def task
    TaskStatus.create(:task_list => params[:task_list], :title => params[:task_title], :description => params[:task_description],
                  :status => params[:status] )
    render :nothing => true
  end
end