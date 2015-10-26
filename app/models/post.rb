class Post < ActiveRecord::Base
  has_many :tags, through: :post_tags
  has_many :post_tags
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end
