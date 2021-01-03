FactoryBot.define do
  factory :comment do
    association :post
    user                { post.user }
    content             { Faker::Lorem.sentence(word_count: 20) }
  end
end
