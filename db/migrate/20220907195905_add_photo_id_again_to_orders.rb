class AddPhotoIdAgainToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :photo_id, :integer
  end
end
