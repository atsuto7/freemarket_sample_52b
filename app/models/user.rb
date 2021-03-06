class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_one :address
  has_many :products
  has_many :cards

  accepts_nested_attributes_for :address

  reg_kana = /\A[ァ-ヴ]+\z/

  validates :nickname, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password, length: { in: 6..128 }, allow_blank: true
  validates :phone_number, presence: true
  validates :kanji_surname, presence: true
  validates :kanji_name, presence: true
  validates :kana_surname, format: { with: reg_kana }, presence: true
  validates :kana_name, format: { with: reg_kana }, presence: true

  def with_address
    build_address if address.nil?
    self
  end

  def self.from_omniauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

end
