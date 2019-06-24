class RemoveProductFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :product_id, :bigint
  end
end
