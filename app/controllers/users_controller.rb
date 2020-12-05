class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update]
  
  def show
    # @user = current_user
    # binding.pry
    @user = User.find(params[:id])
  end

  def update
    binding.pry
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
