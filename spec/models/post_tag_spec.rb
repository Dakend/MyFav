# == Schema Information
#
# Table name: post_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  tag_id     :bigint           not null
#
# Indexes
#
#  index_post_tags_on_post_id             (post_id)
#  index_post_tags_on_post_id_and_tag_id  (post_id,tag_id) UNIQUE
#  index_post_tags_on_tag_id              (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (tag_id => tags.id)
#
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
