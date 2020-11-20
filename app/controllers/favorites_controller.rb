class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.build(post_id: params[:post_id])
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(post_id: params[:post_id])
    @favorite.destroy
  end
end
