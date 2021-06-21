FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'陸太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'リクタロウ'}
    birth_date            {'2001-05-09'}
  end
end