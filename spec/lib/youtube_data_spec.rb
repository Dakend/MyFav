require 'rails_helper'

RSpec.describe 'YouTubDataClass', type: :lib do
  
  before(:all) do
    @youtube_data = YoutubeData.new("https://www.youtube.com/watch?v=6Dld9Lvukz4")
  end

  describe 'new instance' do
    context 'when present Youtube-URL' do
      #  存在するYouTubeURL(通常、共有、埋め込み)の場合は、問題なし
      it 'is PASSED' do
        links = [
          "https://www.youtube.com/watch?v=6Dld9Lvukz4",
          "https://youtu.be/6Dld9Lvukz4",
          "https://www.youtube.com/embed/6Dld9Lvukz4",
        ]
        links.length.times do |n|
          expect(YoutubeData.new(links[n])).to_not be_nil
        end
      end
    end
    context 'when not present Youtube-URL' do
      #  存在しないYouTubeURLの場合は、例外発生
      it 'is FAILED' do
        links = [
          "https://www.youtube.com/watch?v=xxxxxxxxxxx",
          "x",
        ]
        links.length.times do |n|
          expect{YoutubeData.new(links[n])}.to raise_error(RuntimeError)
        end
      end
    end
  end

  describe 'get_title' do
    #  get_titleメソッドの戻り値がnilでない場合は、問題なし
    it 'is PASSED' do
      expect(@youtube_data.get_title).to_not be_nil
    end
  end

  describe 'get_thumbnail' do
    #  get_thumbnailメソッドの戻り値がnilでない場合は、問題なし
    it 'is PASSED' do
      expect(@youtube_data.get_thumbnail).to_not be_nil
    end
  end

  describe 'get_category' do
    #  get_categoryメソッドの戻り値がnilでない場合は、問題なし
    it 'is PASSED' do
      expect(@youtube_data.get_category).to_not be_nil
    end
  end

end