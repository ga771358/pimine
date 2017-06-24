class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
		if session[:verify] != @posts.user_id
            if @posts.userposts.where(user_id: session[:verify]).size == 0
                @posts.userposts.create(user_id: session[:verify])
				@buy_twice = false
            else
				@buy_twice = true
            end
            @same_user = false
        else
            @same_user = true
        end
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = session[:verify]
		@post.save

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
