require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:bookmark) { build_stubbed(:bookmark) }

  describe 'attribute: user_id' do
    context 'when nil' do
      # userが存在しない場合は、無効であること
      it 'is invalid' do
        bookmark.user = nil
        expect(bookmark).to be_invalid
        expect(bookmark.errors[:user]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: post_id' do
    context 'when nil' do
      # postが存在しない場合は、無効であること
      it 'is invalid' do
        bookmark.post = nil
        expect(bookmark).to be_invalid
        expect(bookmark.errors[:post]).to include("を入力してください")
      end
    end
  end
end
