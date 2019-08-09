class Order < ApplicationRecord
  has_one :order_bill
  belongs_to :user
  belongs_to :product
end
