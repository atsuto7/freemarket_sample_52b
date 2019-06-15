class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :kanji_surname,   :string,   null: false
    add_column :users, :kanji_name,      :string,   null: false
    add_column :users, :kana_surname,    :string,   null: false
    add_column :users, :kana_name,       :string,   null: false
    add_column :users, :nickname,        :string,   null: false
    add_column :users, :profile,         :text
    add_column :users, :phone_number,    :integer,  unique: true
    add_column :users, :card_number,     :integer,  null: false
    add_column :users, :validated_date,  :date,     null: false
    add_column :users, :security_cord,   :integer,  null: false
  end
end
