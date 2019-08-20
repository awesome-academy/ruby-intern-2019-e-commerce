class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    price_per_item.to_i * count.to_i
  end
end
