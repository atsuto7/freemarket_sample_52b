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
    postal_code           {"123-4567"}
    prefecture            {"京都府"}
    city                  {"京都市左京区太秦"}
    street_number         {"東蜂岡町１０"}
    building              {"太秦映画村"}
    home_number           {"1234567"}
  end

end