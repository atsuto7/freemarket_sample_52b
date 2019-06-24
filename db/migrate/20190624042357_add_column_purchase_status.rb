class AddColumnPurchaseStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :purchase_status, :integer
  end
end
