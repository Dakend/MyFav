# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
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
