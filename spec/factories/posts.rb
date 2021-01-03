FactoryBot.define do
  factory :post do
    association :user
    title       { Faker::Lorem.sentence(word_count: 5) }
    content     { Faker::Lorem.sentence(word_count: 20) }
  end
end
