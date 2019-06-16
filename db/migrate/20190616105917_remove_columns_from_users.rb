class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :kanji_surname,   :string,   null: false
    remove_column :users, :kanji_name,      :string,   null: false
    remove_column :users, :kana_surname,    :string,   null: false
    remove_column :users, :kana_name,       :string,   null: false
    remove_column :users, :profile,         :text
    remove_column :users, :phone_number,    :integer,  unique: true
    remove_column :users, :card_number,     :integer,  null: false
    remove_column :users, :validated_date,  :date,     null: false
    remove_column :users, :security_cord,   :integer,  null: false
  end
end
