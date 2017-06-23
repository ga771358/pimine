class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save

		redirect_to users_login_path
	end

	def login
		if session[:verify] == nil
			@user = User.new
		else
			redirect_to posts_path
		end
	end

	def check_login
		@user = User.where(:sid => user_params[:sid])

		if @user.count != 0
			session[:verify]= @user[0].id
			redirect_to posts_path
		else
			flash[:error] = "login failed."
			redirect_to users_login_path
		end
	end

	def user_params
		params.require(:user).permit(:sid,:name,:email,:tnum,:score)
	end
end
