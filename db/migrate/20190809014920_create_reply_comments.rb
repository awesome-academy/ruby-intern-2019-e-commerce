class CreateReplyComments < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_comments do |t|
      t.references :comment_rating, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content
      t.string :image
      t.timestamps
    end
  end
end
