class Order < ApplicationRecord
  has_one :order_transaction
  belongs_to :user
  belongs_to :product
  belongs_to :transaction
end
