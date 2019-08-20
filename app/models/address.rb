class Address < ApplicationRecord
  belongs_to :user
  has_one :bill

  scope :get_address_default, ->(user_id) {where user_id: user_id, default: true}

  scope :get_address_of_user, ->(user_id) {where user_id: user_id}

  def get_address
    address_receive + ", " + ward + ", " + district + ", " + province
  end
end
