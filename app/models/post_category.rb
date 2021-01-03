# == Schema Information
#
# Table name: post_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  post_id     :bigint           not null
#
# Indexes
#
#  index_post_categories_on_category_id              (category_id)
#  index_post_categories_on_post_id                  (post_id)
#  index_post_categories_on_post_id_and_category_id  (post_id,category_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (post_id => posts.id)
#
class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category
  validates_uniqueness_of :post_id, scope: :category_id
end
