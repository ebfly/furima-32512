FactoryBot.define do
  factory :item do
    name                   {"gorila"}
    text                   {Faker::Lorem.sentence}
    category_id            {2}
    condition_id           {2}
    prefecture_id          {2}
    shipping_date_id       {2}
    shipping_fee_burden_id {1}
    price                  {"9999"}
  end
end
