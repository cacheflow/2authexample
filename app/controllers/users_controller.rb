class UsersController < ApplicationController

	include ApplicationHelper

def new 
	@user = User.new 
end 


def create 
	@user = User.new(user_params)
	if @user.save 
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
	params.require(:user).permit(:email, :password, :number)
end 

def two_auth 
end 





end
