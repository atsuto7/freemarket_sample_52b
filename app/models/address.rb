class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :postal_code, presence: true
  validates :prefecture_id, numericality: { greater_than: 0 }
  validates :city, presence: true
  validates :street_number, presence: true

end
