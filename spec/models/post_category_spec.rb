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
