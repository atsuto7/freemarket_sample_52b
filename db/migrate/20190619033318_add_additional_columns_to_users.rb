class AddAdditionalColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kanji_surname, :string, null: false
    add_column :users, :kanji_name, :string, null: false
    add_column :users, :kana_surname, :string, null: false
    add_column :users, :kana_name, :string, null: false
    add_column :users, :phone_number, :integer, null: false
  end
end
