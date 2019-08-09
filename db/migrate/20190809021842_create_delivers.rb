class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|
      t.references :user, foreign_key: true
      t.references :bill, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
