class AddNoteToDelivers < ActiveRecord::Migration[5.2]
  def change
    add_column :delivers, :note, :string
  end
end
