class TagsController < ApplicationController
  before_action :set_post_form, only: [:show]
  before_action :get_category_and_tag_to_set_header_menu, only: [:show]

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(6)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
