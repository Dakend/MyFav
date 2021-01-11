# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  default_scope -> { order(created_at: :desc) }
  before_create :get_tag_and_remove_tag
  after_create :create_tag_relation
  validates :title, presence: true

  def is_bookmarked_by?(user)
    self.bookmarks.where(user_id: user.id).exists?
  end

  def is_favorited_by?(user)
    self.favorites.where(user_id: user.id).exists?
  end

  private

    #投稿記事からハッシュタグを抽出、検出した場合は配列に格納、投稿記事からハッシュタグを削除
    def get_tag_and_remove_tag
      @tags  = self.content.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      if @tags.any?
        @tags.each do |tag|
          self.content.gsub!(tag, "")
        end
        self.content.strip!
      else
        return
      end
    end

    #ハッシュタグをTagモデルとPostモデルへ紐付け
    def create_tag_relation
      if @tags.any?
        post = Post.find_by(id: self.id)
        hashes = ["#", "＃"]
        plain_tags = []
        @tags.uniq.each do |tag|
          hashes.each do |hash|
            plain_tags << tag.delete(hash) if tag.include?(hash) 
          end
        end
        plain_tags.uniq.each do |tag|
          tag_obj = Tag.find_or_create_by(name: tag)
          post.tags << tag_obj
        end
      else
        return
      end
    end

end
