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
