class Question < ApplicationRecord
  has_many :reply_questions, dependent: :destroy
  belongs_to :user
  belongs_to :product
end
