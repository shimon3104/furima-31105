FactoryBot.define do
  factory :order_receive do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 1..47) }
    city_name { Faker::Lorem.sentence }
    address { Faker::Lorem.sentence }
    building_name { Faker::Lorem.sentence }
    phone_number { Faker::Number.number(digits: 11) }
  end
end
