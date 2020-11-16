class PostForm
  include ActiveModel::Model
  
  attr_accessor :post_title, :post_content, 
                :movie_link_1, :movie_content_1,
                :movie_link_2, :movie_content_2,
                :movie_link_3, :movie_content_3,
                :movie_link_4, :movie_content_4
  
  validates :post_title, presence: true, length: { maximum: 25 }
  validates :post_content, length: { maximum: 100 }
  validates :movie_link_1, presence: true
  validates :movie_link_2, presence: true
  validates :movie_link_3, presence: true
  validates :movie_link_4, presence: true

  with_options length: { maximum: 88 } do
    validates :movie_content_1
    validates :movie_content_2
    validates :movie_content_3
    validates :movie_content_4
  end

  def save
    return false unless valid?
    # post = current_user.posts.build(title: post_title, content: post_content)
    post = User.find(4).posts.build(title: post_title, content: post_content)
    post.save
    # (1..4).times do |n|
    #   movie = post.movies.build(image: "https://picsum.photos/2#{n}0/3#{n}0",
    #                             link: "movie_link_#{n}".to_sym,
    #                             title: Faker::Lorem.sentence(word_count: 2),
    #                             content: "movie_content_#{n}".to_sym)
    #   movie.save
    # end
    movie_1 = post.movies.build(image: "https://picsum.photos/210/310", 
                                link: movie_link_1,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_1)
    movie_1.save
    movie_2 = post.movies.build(image: "https://picsum.photos/220/320", 
                                link: movie_link_2,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_2)
    movie_2.save
    movie_3 = post.movies.build(image: "https://picsum.photos/230/330", 
                                link: movie_link_3,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_3)
    movie_3.save
    movie_4 = post.movies.build(image: "https://picsum.photos/240/340", 
                                link: movie_link_4,
                                title: Faker::Lorem.sentence(word_count: 2),
                                content: movie_content_4)
    movie_4.save 
    end

end