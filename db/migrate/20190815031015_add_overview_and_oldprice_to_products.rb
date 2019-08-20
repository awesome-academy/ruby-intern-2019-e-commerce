class AddOverviewAndOldpriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :overview, :string
    add_column :products, :old_price, :integer
  end
end
