class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :count
      t.bigint :price_per_item
      t.integer :status
      t.timestamps
    end
  end
end
