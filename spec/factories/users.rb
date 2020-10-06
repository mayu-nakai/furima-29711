FactoryBot.define do
  factory :user do
    nickname              {"ymd"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2000-2-22"}
  end
end
