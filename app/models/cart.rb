class Cart < ApplicationRecord
  has_many :line_items
  has_one :order

  def add_product(product, count_item)
    current_item = line_items.find_by product_id: product.id
    if current_item
      num = current_item.count.to_i + count_item.to_i
      current_item.count = num
    else
      current_item = line_items.build product_id: product.id, price_per_item: product.price,
                                      count: count_item
    end
    current_item
  end

  def total_price
    line_items.to_a.sum(&:total_price)
  end
end
