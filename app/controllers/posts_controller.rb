class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)

		redirect_to posts_path
	end

	def logout
		session[:verify] = nil
		redirect_to root_path
	end

	def post_params
		params.require(:post).permit(:user_id,:title,:itype,:price,:tclick,:location,:content,:is_sold,:avatar)
	end
end
