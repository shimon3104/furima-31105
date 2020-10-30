FactoryBot.define do
  factory :item do
    name {Faker::Name.initials}
    description {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 1..10)}
    item_status_id {Faker::Number.within(range: 1..6)}
    shipping_charges_id {Faker::Number.within(range:1..2)}
    shipping_area_id {Faker::Number.within(range: 1..47)}
    days_to_ship_id {Faker::Number.within(range: 1..3)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
