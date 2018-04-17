class RegistrationsController < ApplicationController
	def new
	end

	def create
	    @user = User.new(user_params)
	      if @user.save
	      	redirect_to root_path
		flash[:notice] = "User has been succesfully created"
	      else
		redirect_to registrations_path
		flash[:notice] = "There was a problem with the registration"
	      end
	    end

    def user_params
      params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
    end

end
