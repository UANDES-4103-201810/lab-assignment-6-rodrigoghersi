class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user and @user.password == params[:session][:password]
		  session[:user] = @user
		  flash[:notice] = "User has been logged in" 
		  cookies.permanent.signed[:user_id] = @user.id
		  redirect_to user_path(@user)
		else
		  redirect_to root_path
		  flash[:notice] = "User hasn't been logged in"
		end
	end

	def destroy
		session.delete(:user_id)
		current_user = nil
		flash[:notice] = "You have been logged out" 
		redirect_to root_path
	end

	private
end
