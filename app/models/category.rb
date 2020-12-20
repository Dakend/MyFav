# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories
  validates :name, presence: true
end
