class ChangeColumnToimageNull < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :images, :product_id,:bigint, null: true # null: trueを明示する必要がある
    end
  
    def down
      change_column :images, :product_id,:bigint, null: false
    end
  end
end
