class CategoriesController < ApplicationController
  def show
    @post_form = PostForm.new
    @category = Category.find(params[:id])
    @posts = @category.posts
  end
end
