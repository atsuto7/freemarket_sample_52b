require 'rails_helper'

describe User do
  describe '#create' do
    context "can save" do

      it "is valid with a factory bot data" do
        user = build(:user)
        expect(user).to be_valid
      end

    end

    context "can not save" do

      it "is invalid without a nickname" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end

      it "is invalid without an email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      it "is invalid without a password_confirmation" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include()
      end

      it "is invalid with a different password" do
        user = build(:user, password: Faker::Lorem.characters(8), password: Faker::Lorem.characters(9))
        user.valid?
        expect(user.errors[:password_confirmation]).to include("入力がパスワードと一致しません")
      end

      it "is invalid with a nickname(21 characters)" do
        user = build(:user, nickname: Faker::Lorem.characters(21))
        user.valid?
        expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
      end

      it "is invalid with a password(5 characters)" do
        password = Faker::Lorem.characters(5)
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end

      it "is invalid with a password(129 characters)" do
        password = Faker::Lorem.characters(129)
        user = build(:user, password: password, password_confirmation: password)
        user.valid?
        expect(user.errors[:password]).to include("は128文字以内で入力してください")
      end

      it "is invalid with a wrong email format(without '@')" do
        user = build(:user, email: "tester1.gmail.com")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "is invalid without a phone_number" do
        user = build(:user, phone_number: nil)
        user.valid?
        expect(user.errors[:phone_number]).to include("を入力してください")
      end

      it "is invalid without a kanji_surname" do
        user = build(:user, kanji_surname: nil)
        user.valid?
        expect(user.errors[:kanji_surname]).to include("を入力してください")
      end

      it "is invalid without a kanji_name" do
        user = build(:user, kanji_name: nil)
        user.valid?
        expect(user.errors[:kanji_name]).to include("を入力してください")
      end

      it "is invalid without a kana_surname" do
        user = build(:user, kana_surname: nil)
        user.valid?
        expect(user.errors[:kana_surname]).to include("を入力してください")
      end

      it "is invalid with a kana_surname which has non-kana characters " do
        user = build(:user, kana_surname: "カナa")
        user.valid?
        expect(user.errors[:kana_surname][0]).to include("は不正な値です")
      end

      it "is invalid without a kana_name" do
        user = build(:user, kana_name: nil)
        user.valid?
        expect(user.errors[:kana_name]).to include("を入力してください")
      end

      it "is invalid with a kana_name which has non-kana characters " do
        user = build(:user, kana_name: "カナa")
        user.valid?
        expect(user.errors[:kana_name][0]).to include("は不正な値です")
      end

    end
  end
end