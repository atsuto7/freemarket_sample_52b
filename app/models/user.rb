class User < ApplicationRecord
  validates :email,          presence: true, format: { with: /@/ }
  validates :kanji_surname,  presence: true, :string
  validates :kanji_name,     presence: true, :string
  validates :kana_surname,   presence: true, :string
  validates :kana_name,      presence: true, :string
  validates :nickname,       presence: true, :string
  validates :phone_number,   unique: true,   :integer 
  validates :card_number,    presence: true, :integer
  validates :validated_date, presence: true, :date
  validates :security_cord,  presence: true, :integer
end
