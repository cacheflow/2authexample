class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def session_create
      current_user = user
  	session[:remember_token] = user.id.to_s 
  end 


def current_user 
  @current_user ||= session[:remember_token] && User.find(session[:remember_token])
end

def signed_in? 
  current_user 
end 

  def authenticate_user 
  	unless self.current_user
  		redirect_to new_session_path 
  	end 
  end

end
