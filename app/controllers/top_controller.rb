class TopController < ApplicationController
  def index
    @posts = Post.all
    # @posts = User.find(4).posts
    @post_form = PostForm.new
    # if user_signed_in? 
    #   # @post = current_user.posts.build
    #   @post_form = PostForm.new
    # end
  end
end
