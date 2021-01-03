require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { build_stubbed(:movie) }

  describe 'attribute: link' do
    context 'when nil' do
      # linkが存在しない場合は、無効であること
      it 'is invalid' do
        movie.link = nil
        expect(movie).to be_invalid
        expect(movie.errors[:link]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: image' do
    context 'when nil' do
      # imageが存在しない場合は、無効であること
      it 'is invalid' do
        movie.image = nil
        expect(movie).to be_invalid
        expect(movie.errors[:image]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: title' do
    context 'when nil' do
      # titleが存在しない場合は、無効であること
      it 'is invalid' do
        movie.title = nil
        expect(movie).to be_invalid
        expect(movie.errors[:title]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: youtube_id' do
    context 'when nil' do
      # youtube_idが存在しない場合は、無効であること
      it 'is invalid' do
        movie.youtube_id = nil
        expect(movie).to be_invalid
        expect(movie.errors[:youtube_id]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: post_id' do
    context 'when nil' do
      # postが存在しない場合は、無効であること
      it 'is invalid' do
        movie.post = nil
        expect(movie).to be_invalid
        expect(movie.errors[:post]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: content' do
    context 'when nil' do
      # contentが存在しない場合でも、有効であること
      it 'is valid' do
        movie.content = nil
        expect(movie).to be_valid
      end
    end
  end

end
