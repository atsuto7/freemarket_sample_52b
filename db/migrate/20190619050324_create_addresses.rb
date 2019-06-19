class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,   null: false
      t.integer :prefecture,    null: false
      t.string  :city,          null: false
      t.string  :street_number, null: false
      t.string  :building
      t.integer :home_number
      t.timestamps
    end
  end
end
