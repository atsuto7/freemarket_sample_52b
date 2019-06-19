class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address

  accepts_nested_attributes_for :address

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, length: { in: 6..128 }, allow_blank: true

  def with_address
    build_address if address.nil?
    self
  end

end
