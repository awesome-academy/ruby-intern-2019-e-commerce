class CommentRating < ApplicationRecord
  has_many :reply_comments, dependent: :destroy
  belongs_to :product
  belongs_to :user
end
