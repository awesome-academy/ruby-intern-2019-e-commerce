class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :count, default: 1
      t.integer :price_per_item

      t.timestamps
    end
  end
end
