class RemoveStatusFromDelivers < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivers, :status, :integer
  end
end
