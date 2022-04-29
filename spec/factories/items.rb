FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {"2"}
    condition_id {"2"}
    postage_id {"2"}
    prefecture_id {"2"}
    delivery_time_id {"2"}
    price {"1000"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image1.png'), filename: 'image1.png')
    end



  end
end
