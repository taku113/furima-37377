FactoryBot.define do
  factory :purchase_shipment do
    postal_code {"123-4567"}
    prefecture_id {"2"}
    city {Faker::Lorem.sentence}
    address {Faker::Lorem.sentence}
    building_name {Faker::Lorem.sentence}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end