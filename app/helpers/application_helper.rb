module ApplicationHelper

def log_in(user)
session[:remember] = user.id 
end 

def current_user 
	@current_user = session[:remember_token] && User.find(session[:remember_token])
end 


def signed_in?
	current_user
end 

end
