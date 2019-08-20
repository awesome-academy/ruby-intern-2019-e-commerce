class AddLikeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :num_like, :integer, default: 0
  end
end
