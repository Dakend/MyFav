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
require 'test_helper'

class PostCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
