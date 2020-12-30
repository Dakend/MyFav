class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :get_category_and_tag_to_set_header_menu, only: [:show]

  def create
    # binding.pry
    @post_form = PostForm.new(post_params)
    if @post_form.save
      @new_post = Post.where(user_id: current_user.id).order(updated_at: :desc).limit(1).first
      flash[:notice] = "投稿が完了しました。"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to root_path, notice: "投稿を削除しました。"
  end

  def show
    @post_form = PostForm.new
    @post = Post.find(params[:id])
    @posts = get_posts_related_to_this_post_category
    @comment = Comment.new
    @comments = @post.comments
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

    def get_posts_related_to_this_post_category
      post_ids_list = @post.categories.map{|category| category.posts.limit(3).ids}
      posts = []
      post_ids_list.each do |post_ids|
        post_ids.each do |post_id|
          posts << Post.find(post_id)
        end
      end
      posts.uniq
    end

end