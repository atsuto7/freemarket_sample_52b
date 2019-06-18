class RemoveprefectureFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :prefecture, :integer 
  end
end
