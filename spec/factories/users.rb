FactoryBot.define do
  factory :user do
    nickname { 'furima' }
    email { 'furima@gmail.com' }
    password { 'f11111' }
    password_confirmation { password }
    last_name { 'フリマ' }
    first_name { 'フリマ' }
    last_name_kana { 'フリマ' }
    first_name_kana { 'フリマ' }
    birth_date { '1930-01-01' }
  end
end
