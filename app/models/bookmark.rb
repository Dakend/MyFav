# == Schema Information
#
# Table name: bookmarks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_post_id              (post_id)
#  index_bookmarks_on_user_id              (user_id)
#  index_bookmarks_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates_uniqueness_of :post_id, scope: :user_id

  def get_post
    Post.find(self.post_id)
  end
end
