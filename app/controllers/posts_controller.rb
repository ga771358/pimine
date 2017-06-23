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
		@post = Post.new(post_params)
		@post.save

		redirect_to posts_path
	end

	def post_params
		params.require(:post).permit(:user_id,:title,:type,:price,:tclick,:location,:content,:is_sold)
	end
end
