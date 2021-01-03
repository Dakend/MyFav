require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:favorite) { build_stubbed(:favorite) }

  describe 'attribute: user_id' do
    context 'when nil' do
      # userが存在しない場合は、無効であること
      it 'is invalid' do
        favorite.user = nil
        expect(favorite).to be_invalid
        expect(favorite.errors[:user]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: post_id' do
    context 'when nil' do
      # postが存在しない場合は、無効であること
      it 'is invalid' do
        favorite.post = nil
        expect(favorite).to be_invalid
        expect(favorite.errors[:post]).to include("を入力してください")
      end
    end
  end
end
