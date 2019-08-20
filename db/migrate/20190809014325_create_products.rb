class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.bigint :price
      t.string :thumbnail
      t.string :description
      t.integer :number_items
      t.integer :count_view
      t.timestamps
    end
  end
end
