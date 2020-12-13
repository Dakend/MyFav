class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  
  def show
    @user = User.find(params[:id])
    @post_form = PostForm.new
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
