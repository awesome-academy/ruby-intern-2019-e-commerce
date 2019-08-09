class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :phone
      t.integer :gender
      t.string :job
      t.date :birthday
      t.integer :role
      t.timestamps
    end
  end
end
