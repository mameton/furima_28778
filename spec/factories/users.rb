FactoryBot.define do
  factory :user do
    name                  { 'Tom' }
    email                 { Faker::Internet.free_email }
    password              { 'abc000' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '加藤' }
    first_name_phonetic   { 'タロウ' }
    last_name_phonetic    { 'カトウ' }
    birthday { '1930-08-19' }
  end
end
