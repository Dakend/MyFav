require 'rails_helper'

RSpec.describe PostForm, type: :model do
  let(:post_form) { build(:post_form) }

  describe 'attribute: post_title' do
    context 'when nil, blank, empty' do
      # post_titleが空白、空、存在しない場合は、無効であること
      it 'is invalid' do
        post_form.post_title = ' '
        expect(post_form).to be_invalid
        expect(post_form.errors[:post_title]).to include("を入力してください")
        post_form.post_title = ''
        expect(post_form).to be_invalid
        expect(post_form.errors[:post_title]).to include("を入力してください")
        post_form.post_title = nil
        expect(post_form).to be_invalid
        expect(post_form.errors[:post_title]).to include("を入力してください")
      end
    end

    context 'when more than 31' do
      # post_titleが31文字以上の場合は、無効であること
      it 'is invalid' do
        post_form.post_title = 'a' * 31
        expect(post_form).to be_invalid
        expect(post_form.errors[:post_title]).to include("は30文字以内で入力してください")
      end
    end
  end

  describe 'attribute: post_content' do
    context 'when more than 401' do
      # post_contentが401文字以上の場合は、無効であること
      it 'is invalid' do
        post_form.post_content = 'a' * 401
        expect(post_form).to be_invalid
        expect(post_form.errors[:post_content]).to include("は400文字以内で入力してください")
      end
    end

    context 'when nil' do
      # post_contentが存在しない場合でも、有効であること
      it 'is valid' do
        post_form.post_content = nil
        expect(post_form).to be_valid
      end
    end
  end

  describe 'attribute: movie_link_1' do
    context 'when nil, blank, empty' do
      # movie_link_1がが空白、空、存在しない場合は、無効であること
      it 'is invalid' do
        post_form.movie_link_1 = ' '
        expect(post_form).to be_invalid
        expect(post_form.errors[:movie_link_1]).to include("を入力してください")
        post_form.movie_link_1 = ''
        expect(post_form).to be_invalid
        expect(post_form.errors[:movie_link_1]).to include("を入力してください")
        post_form.movie_link_1 = nil
        expect(post_form).to be_invalid
        expect(post_form.errors[:movie_link_1]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: movie_content_1' do
    context 'when more than 401' do
      # movie_content_1が401文字以上の場合は、無効であること
      it 'is invalid' do
        post_form.movie_content_1 = 'a' * 401
        expect(post_form).to be_invalid
        expect(post_form.errors[:movie_content_1]).to include("は400文字以内で入力してください")
      end
    end

    context 'when nil' do
      # movie_content_1が存在しない場合でも、有効であること
      it 'is valid' do
        post_form.movie_content_1 = nil
        expect(post_form).to be_valid
      end
    end
  end
end