# == Schema Information
#
# Table name: post_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_post_tags_on_post_id             (post_id)
#  index_post_tags_on_post_id_and_tag_id  (post_id,tag_id) UNIQUE
#  index_post_tags_on_tag_id              (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (tag_id => tags.id)
#
class PostTag < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  validates :post_id, presence: true
  validates :tag_id, presence: true
  validates_uniqueness_of :post_id, scope: :tag_id
end
