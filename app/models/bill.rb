class Bill < ApplicationRecord
  has_many :order_bills, dependent: :destroy
  has_one :deliver
  belongs_to :address
  belongs_to :user
end
