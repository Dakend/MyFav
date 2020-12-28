class TagsController < ApplicationController
  def show
    @post_form = PostForm.new
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(6)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
