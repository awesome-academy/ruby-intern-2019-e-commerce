class CreateOrderTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :order_transactions do |t|
      t.references :transaction, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
