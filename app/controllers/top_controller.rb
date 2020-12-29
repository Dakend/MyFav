class TopController < ApplicationController
  def index
    @posts = Post.limit(10)

    @category_entertainment = Category.find_by(name: "エンターテイメント")
    @posts_entertainment = Category.find_by(name: "エンターテイメント").posts.limit(10)

    # @category_music = Category.find_by(name: "音楽")
    # @posts_music = @category_music.posts.limit(10)

    # @category_film_animation = Category.find_by(name: "映画/アニメ")
    # @posts_film_animation = @category_film_animation.posts.limit(10)

    # @category_sports = Category.find_by(name: "スポーツ")
    # @posts_sports = @category_sports.posts.limit(10)

    @posts_latest_favorite = Favorite.order(created_at: :desc).limit(5).map{|favorite| favorite.post}

    @post_form = PostForm.new
  end
end
