# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  image      :string(255)      not null
#  link       :string(255)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  youtube_id :string(255)
#
# Indexes
#
#  index_movies_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
FactoryBot.define do
  factory :movie do
    association :post
    image        { "https://i.ytimg.com/vi/6Dld9Lvukz4/hqdefault.jpg" }
    link         { "https://www.youtube.com/watch?v=6Dld9Lvukz4" }
    title        { "【AWS Black Belt Online Seminar】2020年 AWS re:Invent 速報 Part3" }
    content      { Faker::Lorem.sentence(word_count: 20) }
    youtube_id   { "6Dld9Lvukz4" }
  end
end
