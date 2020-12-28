class CategoriesController < ApplicationController
  def show
    @post_form = PostForm.new
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page]).per(6)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
