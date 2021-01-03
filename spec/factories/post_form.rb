FactoryBot.define do
  factory :post_form do
    post_title       { Faker::Lorem.sentence(word_count: 5) }
    post_content     { Faker::Lorem.sentence(word_count: 20) }
    movie_link_1     { "https://www.youtube.com/watch?v=6Dld9Lvukz4" }
    movie_link_2     { "https://www.youtube.com/watch?v=_j6YIke6lnU" }
    movie_link_3     { "https://www.youtube.com/watch?v=gcJwNEQ2eLY" }
    movie_link_4     { "https://www.youtube.com/watch?v=u_n8nhZgwrw" }
    movie_content_1  { Faker::Lorem.sentence(word_count: 20) }
    movie_content_2  { Faker::Lorem.sentence(word_count: 20) }
    movie_content_3  { Faker::Lorem.sentence(word_count: 20) }
    movie_content_4  { Faker::Lorem.sentence(word_count: 20) }
    user_id          { 1 }
  end
end