class Transaction < ApplicationRecord
  has_many :products
  belongs_to :order
  has_one :deliver
  has_one :order_transaction
  has_one :address
end
