class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
