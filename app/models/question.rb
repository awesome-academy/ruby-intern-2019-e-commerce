class Question < ApplicationRecord
  has_many :reply_questions, dependent: :destroy
  belongs_to :user
  belongs_to :product

  scope :get_question_product, ->(product_id){where product_id: product_id}
end
