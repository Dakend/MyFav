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
require 'rails_helper'

RSpec.describe PostCategory, type: :model do
  let(:post_category) { build_stubbed(:post_category) }

  describe 'attribute: post_id' do
    context 'when nil' do
      # postが存在しない場合は、無効であること
      it 'is invalid' do
        post_category.post = nil
        expect(post_category).to be_invalid
        expect(post_category.errors[:post]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: cateogry_id' do
    context 'when nil' do
      # categoryが存在しない場合は、無効であること
      it 'is invalid' do
        post_category.category = nil
        expect(post_category).to be_invalid
        expect(post_category.errors[:category]).to include("を入力してください")
      end
    end
  end
end
