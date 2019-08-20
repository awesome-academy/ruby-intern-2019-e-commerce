class Product < ApplicationRecord
  has_many :image_slides, dependent: :destroy
  has_many :comment_ratings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :line_items
  belongs_to :category

  scope :list_product_category, ->(array){where category_id: array}
end
