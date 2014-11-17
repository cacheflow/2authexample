class SessionsController < ApplicationController
	include ApplicationHelper 


	def new 
	end 


	def create 
	    @user = User.where(email: params[:session][:email]).first

	    if @user && @user.authenticate(params[:session][:password])
			session_create 
			redirect_to in_path notice: "You've logged in!"
		else 
			flash.now[:notice] = "invalid login"
			render :new
		end 
	end 


	def destroy 
		session.delete[:remember_token]
		redirect_to new_session_path 
	end 






end
