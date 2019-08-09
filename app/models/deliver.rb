class Deliver < ApplicationRecord
  has_one :transaction
  has_one :user
end
