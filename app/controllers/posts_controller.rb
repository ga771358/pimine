class PostsController < ApplicationController

	before_action :check_session

	def index
		@posts = Post.all
	end

	def show
		@posts = Post.find(params[:id])
		if session[:verify] != @posts.user_id
            if @posts.userposts.where(user_id: session[:verify]).size == 0
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

		if @post.errors.any?
			flash[:error] = @post.errors.full_messages
			render :action => :new
		else
			redirect_to posts_path
		end
	end

	def logout
		session[:verify] = nil
		redirect_to root_path
	end

	def complete
		sell = Post.where(user_id: session[:verify])
		@c_sell = sell.where(is_sold: true)
		@buy = Post.where(buyer_id: session[:verify])
	end

	def not_finish
		sell = Post.where(user_id: session[:verify])
		@n_sell = sell.where(is_sold: false)
	end

	def post_params
		params.require(:post).permit(:user_id,:buyer_id,:title,:itype,:price,:tclick,:location,:content,:is_sold,:avatar)
	end

	def check_session
		if session[:verify] == nil
			redirect_to root_path
		end	
	end
end
