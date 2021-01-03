require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build_stubbed(:comment) }

  describe 'attribute: user_id' do
    context 'when nil' do
      # userが存在しない場合は、無効であること
      it 'is invalid' do
        comment.user = nil
        expect(comment).to be_invalid
        expect(comment.errors[:user]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: post_id' do
    context 'when nil' do
      # postが存在しない場合は、無効であること
      it 'is invalid' do
        comment.post = nil
        expect(comment).to be_invalid
        expect(comment.errors[:post]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: content' do
    context 'when nil, blank, empty' do
      # contentが存在しない場合は、無効であること
      it 'is invalid' do
        comment.content = ' '
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("を入力してください")
        comment.content = ''
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("を入力してください")
        comment.content = nil
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("を入力してください")
      end
    end

    context 'when more than 401' do
      # contentが401文字以上の場合は、無効であること
      it 'is invalid' do
        comment.content = 'a' * 401
        expect(comment).to be_invalid
        expect(comment.errors[:content]).to include("は400文字以内で入力してください")
      end
    end
  end


end
