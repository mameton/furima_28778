FactoryBot.define do
  factory :transaction do
    post_number               {'000-0000'}
    buyer_prefecture_id       { '2' }
    city                      { '栃木市' }
    address                   { '蔵野町123' }
    building_name             { ' ' }
    phone_number              { '00000000000' }
    pay_id                    { '1' }
    association :pay
  end
end
