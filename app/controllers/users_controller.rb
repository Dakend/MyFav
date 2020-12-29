class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page_1]).per(4)
    @user_bookmark_posts = @user.bookmark_posts.page(params[:page_2]).per(4)
    @post_form = PostForm.new
    respond_to do |format|
      format.html
      format.js
    end
    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user, notice: "プロフィールを更新しました。"
  end

  private
    def user_params
      params.require(:user).permit(:icon, :name, :profile)
    end
end
