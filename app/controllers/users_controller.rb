class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  before_action :set_post_form, only: [:show]
  before_action :get_category_and_tag_to_set_header_menu, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page_1]).per(4)
    @user_bookmark_posts = @user.bookmark_posts.page(params[:page_2]).per(4)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "プロフィールを更新しました。"
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:icon, :name, :profile)
    end
end
