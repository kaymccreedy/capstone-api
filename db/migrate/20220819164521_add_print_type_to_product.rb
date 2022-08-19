class AddPrintTypeToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :print_type, :string
  end
end
