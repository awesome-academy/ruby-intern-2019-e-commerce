class AddLikeToReplyQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :reply_questions, :num_like, :integer, default: 0
  end
end
