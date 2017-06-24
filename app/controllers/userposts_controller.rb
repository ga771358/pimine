class UserpostsController < ApplicationController
    def create
        @post = Post.find(params[:pid])
        if session[:verify] != @post.user_id
            @post.userposts.create(user_id: session[:verify])
            @same_user = false
        else
            @same_user = true
        end

        redirect_to post_path(params[:pid],same:@same_user)
    end

end
