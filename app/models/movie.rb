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
class Movie < ApplicationRecord
  belongs_to :post
  validates :image, presence: true
  validates :link, presence: true
  validates :title, presence: true
  validates :youtube_id, presence: true
end
