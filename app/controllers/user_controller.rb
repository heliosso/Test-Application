class UserController < ApplicationController
  def index
    if request.post?
      @user = User.new(params[:user])
      if @user.save
        session[:id] = @user.id
	redirect_to task_lists_path
      end
    end
  end
 
  def login
    if request.post?
      @user = User.new(params[:user])
 
      user = User.find_by_username(@user.username)
 
      if user and user.password_matches?(@user.password)
        session[:id] = user.id
        redirect_to task_lists_path and return false
      else
        flash[:notice] = 'Invalid Username or Password!'
      end
    end
  end

  def logout
    if session[:id]
      reset_session
      flash[:notice] = 'Logged out successfully!'
      redirect_to :action => :login
    end
  end
end