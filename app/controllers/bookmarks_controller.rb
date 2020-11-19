class BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.build(post_id: params[:post_id])
    @bookmark.save
  end

  def destroy
    @bookmark = current_user.bookmarks.find_by(post_id: params[:post_id])
    @bookmark.destroy
  end
end
