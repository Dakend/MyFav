class PostForm
  include ActiveModel::Model
  
  attr_accessor :post_title, :post_content, 
                :movie_link_1, :movie_content_1,
                :movie_link_2, :movie_content_2,
                :movie_link_3, :movie_content_3,
                :movie_link_4, :movie_content_4,
                :user_id
  
  validates :post_title, presence: true, length: { maximum: 30 }
  validates :post_content, length: { maximum: 400 }
  validates :movie_link_1, presence: true
  validates :movie_link_2, presence: true
  validates :movie_link_3, presence: true
  validates :movie_link_4, presence: true

  with_options length: { maximum: 400 } do
    validates :movie_content_1
    validates :movie_content_2
    validates :movie_content_3
    validates :movie_content_4
  end


  def save
    return false unless valid?
    @post = Post.new(title: post_title, content: post_content, user_id: user_id)
    @post.save
    create_movies_and_category_relation
  end

  private
  
    def create_movies_and_category_relation
      movie_links = [movie_link_1, movie_link_2, movie_link_3, movie_link_4]
      movie_contents = [movie_content_1, movie_content_2, movie_content_3, movie_content_4]
      @category_list = []
      movie_links.length.times {|num|
        fetch_youtube_data(movie_links[num])
        params = create_params(movie_links[num], movie_contents[num])
        @post.movies.create(params)
        add_movie_category_to_category_list
      }
      create_category_relation
    end

    def fetch_youtube_data(movie_link)
      @movie_data = YoutubeData.new(movie_link)
    end

    def create_params(movie_link, movie_content)
      params = {
        image: @movie_data.get_thumbnail,
        link: movie_link,
        title: @movie_data.get_title,
        content: movie_content,
        youtube_id: @movie_data.movie_id,
      }
    end

    def add_movie_category_to_category_list
      @category_list << @movie_data.get_category
    end

    def create_category_relation
      @category_list.uniq.each do |category|
        category_obj = Category.find_or_create_by(name: category)
        @post.categories << category_obj
      end
    end

end