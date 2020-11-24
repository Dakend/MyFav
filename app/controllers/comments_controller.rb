class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @comment = current_user.comments.build(comment_params) 
    if @comment.save
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
