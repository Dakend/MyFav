FactoryBot.define do
  factory :category do
    name                { Faker::Lorem.sentence(word_count: 1) }
  end
end
