FactoryBot.define do
  factory :bookmark do
    association :post
    user                { post.user }
  end
end
