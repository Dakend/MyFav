require 'rails_helper'

RSpec.describe PostTag, type: :model do
  let(:post_tag) { build_stubbed(:post_tag) }

  describe 'attribute: post_id' do
    context 'when nil' do
      #  postが存在しない場合は、無効であること
      it 'is invalid' do
        post_tag.post = nil
        expect(post_tag).to be_invalid
        expect(post_tag.errors[:post]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: tag_id' do
    context 'when nil' do
      #  tagが存在しない場合は、無効であること
      it 'is invalid' do
        post_tag.tag = nil
        expect(post_tag).to be_invalid
        expect(post_tag.errors[:tag]).to include("を入力してください")
      end
    end
  end
end
