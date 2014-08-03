# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery :only => [:create, :update, :destroy] # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  protected
  
  def login_required
    if !session[:id]
      redirect_to "/user/login"
      return false
    end
  end

  def current_user
    User.find(session[:id]) if session[:id]
  end
end