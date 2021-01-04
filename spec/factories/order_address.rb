FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '西東京市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'09011112222'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
