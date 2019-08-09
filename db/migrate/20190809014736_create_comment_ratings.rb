class CreateCommentRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_ratings do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
