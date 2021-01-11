# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
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
