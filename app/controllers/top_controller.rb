class TopController < ApplicationController
  def index
    @posts = Post.all
    @post_form = PostForm.new
  end
end
