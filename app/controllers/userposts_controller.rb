class UserpostsController < ApplicationController
    	
    before_action :check_session

    def create
        @post = Post.find(params[:pid])
        t_num = @post.userposts.size
        @post.userposts.create(user_id: session[:verify],order: t_num+1)

        redirect_to post_path(params[:pid])
    end
    def destroy
        @post = Post.find(params[:post_id])
        @post.userposts.where(id: params[:id])[0].destroy
        redirect_to controller: :posts,action: :not_finish_show , id: params[:post_id]
    end
	def check_session
		if session[:verify] == nil
			redirect_to root_path
		end	
	end
end
