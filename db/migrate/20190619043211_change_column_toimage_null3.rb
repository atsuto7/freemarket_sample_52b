class ChangeColumnToimageNull3 < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :images, :product,:references, null: true, foreign_key: true# null: trueを明示する必要がある
    end
  
    def down
      change_column :images, :product,:references, null: false, foreign_key: true
    end
  end
end