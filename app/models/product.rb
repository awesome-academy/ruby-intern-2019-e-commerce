class Product < ApplicationRecord
  has_many :image_slides, dependent: :destroy
  has_many :comment_ratings, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :orders
  belongs_to :category
end
