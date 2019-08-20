class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :childs, class_name: Category.name, foreign_key: :parent_id,
    dependent: :destroy
  belongs_to :parent, class_name: Category.name, optional: true

  scope :list_parent_level_1, ->{where parent_id: nil}
  scope :list_child_category, ->(array){where parent_id: array}
end
