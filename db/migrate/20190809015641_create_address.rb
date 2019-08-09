class CreateAddress < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :phone
      t.string :address_receive
      t.string :province
      t.string :district
      t.string :ward
      t.boolean :default
      t.timestamps
    end
  end
end
