class Comment < ActiveRecord::Base
  belongs_to :comment

  validates :author, presence: true
  validates :body, presence: true
end
