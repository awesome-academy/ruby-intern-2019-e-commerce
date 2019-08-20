class AddPriceShipToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :price_ship, :integer
  end
end
