class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.save

		redirect_to users_login_path
	end

	def show
		@user = User.new
	end

	def check_login
		@user = User.where(:sid => user_params[:sid])
		redirect_to posts_path
	end

	def user_params
		params.require(:user).permit(:sid,:name,:email,:tnum,:score)
	end
end
