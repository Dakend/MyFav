require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build_stubbed(:post) }

  describe 'attribute: title' do
    context 'when nil' do
      #  titleが存在しない場合は、無効であること
      it 'is invalid' do
        post.title = nil
        expect(post).to be_invalid
        expect(post.errors[:title]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: user_id' do
    context 'when nil' do
      # userが存在しない場合は、無効であること
      it 'is invalid' do
        post.user = nil
        expect(post).to be_invalid
        expect(post.errors[:user]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: content' do
    context 'when nil' do
      # contentが存在しない場合でも、有効であること
      it 'is valid' do
        post.content = nil
        expect(post).to be_valid
      end
    end
  end
end
