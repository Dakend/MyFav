class PostsController < ApplicationController
  def create
    @post_form = PostForm.new(post_params)
    # binding.pry
    if @post_form.save
      # redirect_to root_path
      flash[:success] = "Post created!"
      # redirect_to root_path
      @new_post = Post.where(user_id: 4).order(updated_at: :desc).limit(1).first
      # @new_post = Post.where(user_id: current_user.id).order(updated_at: :desc).limit(1)
      # binding.pry
    else
      # binding.pry
    end
  end

  private
    def post_params
      params.require(:post_form).permit(
        :post_title, :post_content,
        :movie_link_1, :movie_content_1,
        :movie_link_2, :movie_content_2,
        :movie_link_3, :movie_content_3,
        :movie_link_4, :movie_content_4)
    end
end