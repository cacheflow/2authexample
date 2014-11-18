class SessionsController < ApplicationController
	include ApplicationHelper 


	def new 
	end 


	def create 
		@user = User.where(email: params[:session][:email], number: params[:session][:number]).first
		if @user && @user.authenticate(params[:session][:password])
			@user.send_auth 
			if  @user.authenticate_otp 
				session[:remember_token] = @user.id.to_s 
				@current_user = user 
				redirect_to in_path 
			
			end 
		end 
	end 

	def destroy 
		session.delete(:remember_token)
		redirect_to new_session_path 
	end 


	



end
