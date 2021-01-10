FactoryBot.define do
  factory :user do
    name                  { "Alice" }
    email                 { "alice@example.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
    profile               { Faker::Lorem.sentence(word_count: 20) }
  end
end
