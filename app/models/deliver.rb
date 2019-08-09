class Deliver < ApplicationRecord
  belongs_to :bill
  belongs_to :user
end
