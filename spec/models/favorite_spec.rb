# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_post_id              (post_id)
#  index_favorites_on_user_id              (user_id)
#  index_favorites_on_user_id_and_post_id  (user_id,post_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (user_id => users.id)
#
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
