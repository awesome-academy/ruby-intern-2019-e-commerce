class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|
      t.references :user, foreign_key: true
      t.references :transaction, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
