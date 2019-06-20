class Address < ApplicationRecord
  belongs_to :user

  reg_postal_code = /\A[0-9]{3}\-[0-9]{4}+\z/

  validates :postal_code, presence: true, format: { with: reg_postal_code }
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :street_number, presence: true

end
