FactoryBot.define do
  factory :user do
    first_name { '太郎' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    nick_name { 'ヤマダ太郎' }
    birthday { '1930-01-31' }
    email { Faker::Internet.free_email }
    password { 'test1234' }
    password_confirmation { password }
  end
end
