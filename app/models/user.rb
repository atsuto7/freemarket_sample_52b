class User < ApplicationRecord
  has_one :address
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, length: { in: 6..128 }, allow_blank: true
end
