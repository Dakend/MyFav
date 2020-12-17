require 'google/apis/youtube_v3'
require 'csv'

class YoutubeData

  YOUTUBE = Google::Apis::YoutubeV3::YouTubeService.new
  YOUTUBE.key = Rails.application.credentials.google[:api_key]

  def initialize(url)
    movie_id = YoutubeData.get_movie_id(url)
    raise 'invalid url' if movie_id.instance_of?(Array)
    options = { :id => movie_id }
    @response = YOUTUBE.list_videos("snippet", options)
    raise 'invalid response' unless @response.items.any?
  end

  def get_title
    @response.items[0].snippet.title
  end

  def get_thumbnail
    @response.items[0].snippet.thumbnails.high.url
  end

  def get_category
    movie_category_id = @response.items[0].snippet.category_id
    categories = YoutubeData.get_categories_hash_from_csv
    categories[movie_category_id] ? categories[movie_category_id] : "その他"
  end

  def self.get_movie_id(url)
    id = ''
    url = url.gsub(/(>|<)/i,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if url[2] != nil
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0];
    else
      id = url;
    end
    id
  end

  def self.get_categories_hash_from_csv
    categories = {}
    CSV.foreach("app/assets/csv/youtube_movie_category.csv") do |row|
      categories[row[0]] = row[1]
    end
    categories
  end

end