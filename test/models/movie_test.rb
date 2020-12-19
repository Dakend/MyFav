# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  image      :string(255)
#  link       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  youtube_id :string(255)
#
# Indexes
#
#  index_movies_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
