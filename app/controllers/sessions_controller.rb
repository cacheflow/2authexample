class SessionsController < ApplicationController
	include ApplicationHelper 


	def new 
	end 


	def create 
		@user = User.where(email: params[:session][:email])
		if @user == nil || @user.authenticate(params[:session][:password])
			flash[:error] = "Invalid email format"
			render "new"
		else 
			session[:remember_token] = @user.id.to_s 
			@current_user = user 
			redirect_to root_path 
		end 
	end 

	def destroy 
		session.delete[:remember_token]
		redirect_to new_session_path 
	end 






end
