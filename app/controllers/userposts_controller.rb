class UserpostsController < ApplicationController
    def create
        @post = Post.find(params[:pid])
        @post.userposts.create(user_id: session[:verify])
        redirect_to post_path(params[:pid])
    end

end
