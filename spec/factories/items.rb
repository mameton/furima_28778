FactoryBot.define do
  factory :item do
    name                         { '木' }
    text                         { '木です' }
    category_id                  { '3' }
    price                        { '1000' }
    condition_id                 { '3' }
    postage_id                   { '2' }
    exhibitor_prefecture_id      { '12' }
    days_id                      { '2' }
    association :user
  end
end
