class AddPhotoIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :photo_id, :string
  end
end
