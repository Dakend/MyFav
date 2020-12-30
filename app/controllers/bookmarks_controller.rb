class BookmarksController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :get_category_and_tag_to_set_header_menu, only: [:show]

  def create
    @bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    @bookmark.save
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(post_id: params[:post_id])
    @bookmark.destroy
  end
end
