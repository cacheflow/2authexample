class UsersController < ApplicationController



def new 
	@user = User.new 
end 


def create 
	@user = User.new(user_params)
	if @user.save 
		session_create 
		redirect_to in_path 
	else 
		render 'new'
	end 
end 


def logged_in
end 

def destroy 
	@user.destroy
	redirect_to new_user_path 
end  


def user_params
	params.require(:user).permit(:email, :password)
end 






end