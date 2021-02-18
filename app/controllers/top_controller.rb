class TopController < ApplicationController
  before_action :set_post_form, only: [:index]
  before_action :get_category_and_tag_to_set_header_menu, only: [:index]

  def index
    @posts = Post.limit(10)

    @category_howto_style = Category.find_by(name: "ハウツー/スタイル")
    @posts_howto_style = @category_howto_style.posts.limit(10) if @category_howto_style

    
    @category_music = Category.find_by(name: "音楽")
    @posts_music = @category_music.posts.limit(10) if @category_music
    
    @category_entertainment = Category.find_by(name: "エンターテイメント")
    @posts_entertainment = @category_entertainment.posts.limit(10) if @category_entertainment

    @category_film_animation = Category.find_by(name: "映画/アニメ")
    @posts_film_animation = @category_film_animation.posts.limit(10) if @category_film_animation


    @posts_latest_favorite = Favorite.order(created_at: :desc).limit(5).map{|favorite| favorite.post}

  end
end
