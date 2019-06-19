class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :images
  accepts_nested_attributes_for :images
  enum status: { "---" => 0, "新品、未使用" => 1, "未使用に近い" => 2, "目立った傷や汚れなし" => 3, "やや傷や汚れあり" => 4, "傷や汚れあり" => 5, "全体的に状態が悪い" => 6}
  enum obligation_fee: { "--- " => 0, "送料込み(出品者負担)" => 1, "着払い(購入者負担)" => 2}
  enum deliverytime: { "---  " => 0, "1~2日で発送" => 1, "2~3日で発送" => 2, "4~7日で発送" => 3}
  enum shipment_method: { "---   " => 0, "未定" => 1, "らくらくメルカリ便" => 2, " ゆうメール" => 3, "レターパック" => 4, "普通郵便(定型、定型外)" => 5, "クロネコヤマト" => 6, "ゆうパック" => 7, "クリックポスト" => 8, "ゆうパケット" => 9}
end
