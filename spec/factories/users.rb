FactoryBot.define do

  factory :user do
    password = "tester1234"

    nickname              {"ダイスケ"}
    email                 {"kishi@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    phone_number          {"08011223344"}
    kanji_surname         {"岸"}
    kanji_name            {"大介"}
    kana_surname          {"キシ"}
    kana_name             {"ダイスケ"}
  end

end
