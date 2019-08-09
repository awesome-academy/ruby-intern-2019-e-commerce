class User < ApplicationRecord
  has_many :addresses, dependent: :destroy
  has_many :transactions
  has_many :reply_comments, dependent: :destroy
  has_many :comment_ratings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :reply_questions, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :deliver
end
