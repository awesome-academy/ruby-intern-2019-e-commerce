class CreateOrderTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_bills do |t|
      t.references :bill, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
