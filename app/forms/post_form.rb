class PostForm
  include ActiveModel::Model
  
  attr_accessor :post_title, :post_content, 
                :movie_link_1, :movie_content_1,
                :movie_link_2, :movie_content_2,
                :movie_link_3, :movie_content_3,
                :movie_link_4, :movie_content_4,
                :user_id
  
  validates :post_title, presence: true, length: { maximum: 50 }
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
    # binding.pry
    post = Post.new(title: post_title, content: post_content, user_id: user_id)
    post.save
    post.movies.create(image: "https://picsum.photos/210/310", 
                                link: movie_link_1,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_1)
    post.movies.create(image: "https://picsum.photos/220/320", 
                                link: movie_link_2,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_2)
    post.movies.create(image: "https://picsum.photos/230/330", 
                                link: movie_link_3,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_3)
    post.movies.create(image: "https://picsum.photos/240/340", 
                                link: movie_link_4,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_4)
    end

end