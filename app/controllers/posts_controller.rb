class PostsController < ApplicationController

	before_action :check_session

	def index
		@posts = Post.all
		@post = Post.new
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

	def search
		@posts = Post.new
		@post = Post.where([ "title like ?", "%#{post_params[:title]}%"] )
		@post = @post.where([ "itype like ?", "%#{post_params[:itype]}%"] )
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
		@allpost = Post.where(is_sold: true)
		@sellpost = @allpost.where(user_id: session[:verify])
		@buypost = @allpost.where(buyer_id: session[:verify])
	end

	def not_finish
		sell = Post.where(user_id: session[:verify])
		@n_sell = sell.where(is_sold: false)
	end

	def not_finish_show
		@post = Post.find(params[:id])
		@paipeople = @post.userposts.all
	end

	def not_finish_sell
		@post = Post.find(params[:post_id])

		@post.buyer_id=params[:buyer_id]
		@post.is_sold=true
		
		@post.save

		redirect_to posts_path(post_id: params[:post_id],buyer_id: params[:buyer_id])

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
