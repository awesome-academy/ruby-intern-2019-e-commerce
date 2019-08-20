class RemoveCountProductidPriceStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :product_id, :integer
    remove_column :orders, :count, :integer
    remove_column :orders, :price_per_item, :integer
    remove_column :orders, :status, :integer
  end
end
