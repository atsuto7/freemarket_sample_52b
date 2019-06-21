class ChangeColumnToimageNull2 < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :images, :product,:bigint, null: true # null: trueを明示する必要がある
    end
  
    def down
      change_column :images, :product,:bigint, null: false
    end
  end
end
