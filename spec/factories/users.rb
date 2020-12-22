FactoryBot.define do
  factory :user do
    nickname              { 'now' }
    email                 { Faker::Internet.free_email }
    password              { 'abc123' }
    password_confirmation { password }
    first_name            { 'くるよ' }
    last_name             { 'いくよ' }
    first_name_kana       { 'クルヨ' }
    last_name_kana        { 'イクヨ' }
    birth_day             { '1949-06-04' }
  end
end
