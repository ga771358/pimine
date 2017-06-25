class UserpostsController < ApplicationController
    	
    before_action :check_session

    def create
        @post = Post.find(params[:pid])
        t_num = @post.userposts.size
        @post.userposts.create(user_id: session[:verify],order: t_num+1)

        redirect_to post_path(params[:pid])
    end

	def check_session
		if session[:verify] == nil
			redirect_to root_path
		end	
	end
end
