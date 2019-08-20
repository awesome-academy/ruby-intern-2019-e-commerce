class Bill < ApplicationRecord
  has_one :order_bill, dependent: :destroy
  has_one :deliver
  belongs_to :address
  belongs_to :user

  scope :get_bill_of_user, (lambda do |user_id|
    where user_id: user_id
  end)

  scope :get_bill_not_transport, ->{where status: 0}
end
