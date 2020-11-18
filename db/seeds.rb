# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |n|
  User.create!(
    email: "test#{n + 1}@example.com",
    password: "password_#{n + 1}",
    name: "test_user_#{n + 1}",
  )
end

users = User.all
2.times do |n|
  content = Faker::Lorem.sentence(word_count: 5)
  title = "test_title_#{n + 1}"
  user_id = n + 1
  users.each { |user| user.posts.create!(content: content, title: title, user_id: user_id) }
end

posts = Post.all
3.times do |n|
   content = Faker::Lorem.sentence(word_count: 5)
   image = "https://picsum.photos/210/310"
   link = "https://www.youtube.com/"
   title = "test_title_#{n + 1}"
   post_id = n + 1
   posts.each { |post| post.movies.create!(content: content, image: image, 
                                           link: link, title: title, post_id: post_id) }
end