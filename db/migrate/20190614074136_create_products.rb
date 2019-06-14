class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,         null: false,  index: true
      t.string :image,        null: false
      t.text :description,   null: false
      t.integer :status,        null: false
      t.integer :obligation_fee, null: false
      t.integer :shipment_method, null: false
      t.integer :prefecture, null: false
      t.string :brand,                      index: true
      t.integer :deliverytime,   null: false 
      t.integer :price,          null: false
      t.timestamps null: false
    end
  end
end
