FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    first_name {Faker::Name.first_name}
    first_name_kana {"カタカナ"}
    family_name {Faker::Name.last_name}
    family_name_kana {"カタカナ"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday {"1945-01-01"}
  end
end