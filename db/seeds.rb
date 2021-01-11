# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

CSV.foreach('db/csv/seed_users.csv', headers: true) do |row|
  User.create(
    name: row['name'],
    email: row['email'],
    password: row['password'],
    profile: row['profile']
  )
end

(1..4).each do |n|
  user = User.find(n)
  user.icon.attach(io: File.open("app/assets/images/users/user_#{n}_icon.jpg"), filename: "user_#{n}_icon.jpg")
end

CSV.foreach('db/csv/seed_posts.csv', headers: true) do |row|
  post = PostForm.new(
    post_title: row['post_title'],
    post_content: row['post_content'],
    movie_link_1: row['movie_link_1'],
    movie_content_1: row['movie_content_1'],
    movie_link_2: row['movie_link_2'],
    movie_content_2: row['movie_content_2'],
    movie_link_3: row['movie_link_3'],
    movie_content_3: row['movie_content_3'],
    movie_link_4: row['movie_link_4'],
    movie_content_4: row['movie_content_4'],
    user_id: row['user_id']
  )
  post.save
end