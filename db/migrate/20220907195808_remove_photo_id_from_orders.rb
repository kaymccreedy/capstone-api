class RemovePhotoIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :photo_id, :string
  end
end
