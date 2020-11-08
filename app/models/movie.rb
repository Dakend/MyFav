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
#
class Movie < ApplicationRecord
  validates :image, presence: true
  validates :link, presence: true
  validates :title, presence: true
end
