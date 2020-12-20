class TagsController < ApplicationController
  def show
    @post_form = PostForm.new
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end
end
