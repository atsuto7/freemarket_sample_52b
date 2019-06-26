class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :category, :integer, null: false
  end
end
