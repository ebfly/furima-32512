FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '西東京市' }
    house_number { '1-1' }
    building_name { "ゴリラビル" }
    phone_number {'09011112222'}
    user_id { 2 }
    item_id { 2 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
