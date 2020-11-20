# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :user_id, presence: true

  def username
    User.find(self.user_id).name
  end

  def is_bookmarked_by?(user)
    self.bookmarks.where(user_id: user.id).exists?
  end

  def is_favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end
end
