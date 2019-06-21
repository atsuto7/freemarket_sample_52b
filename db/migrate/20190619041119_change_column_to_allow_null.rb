class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :image, :product_id,:bigint, null: true # null: trueを明示する必要がある
    end
  
    def down
      change_column :image, :product_id,:bigint, null: false
    end
  end
end
