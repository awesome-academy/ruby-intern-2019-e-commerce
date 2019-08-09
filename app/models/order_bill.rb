class OrderBill < ApplicationRecord
  belongs_to :bill
  belongs_to :order
end
