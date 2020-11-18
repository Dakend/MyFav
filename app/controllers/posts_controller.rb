class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  def create
    # binding.pry
    @post_form = PostForm.new(post_params)
    if @post_form.save
      flash[:success] = "Post created!"
      # binding.pry
      @new_post = Post.where(user_id: current_user.id).order(updated_at: :desc).limit(1).first
    else
      # binding.pry
      flash[:success] = "hoge!!!!!"
      @flash = flash
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    # binding.pry
  end

  private
    def post_params
      params.require(:post_form).permit(:post_title, :post_content,
                                        :movie_link_1, :movie_content_1,
                                        :movie_link_2, :movie_content_2,
                                        :movie_link_3, :movie_content_3,
                                        :movie_link_4, :movie_content_4)
                                        .merge(user_id: current_user.id)
    end
end