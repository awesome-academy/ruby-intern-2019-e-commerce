class Order < ApplicationRecord
  has_one :transaction
  has_one :order
end
