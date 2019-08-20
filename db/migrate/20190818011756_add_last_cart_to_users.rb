class AddLastCartToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_cart, :integer
  end
end
