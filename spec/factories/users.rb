FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    first_name {"阿いうえお"}
    first_name_kana {"カタカナ"}
    family_name {"下きくけこ"}
    family_name_kana {"カタカナ"}
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    birthday {"1945-01-01"}
  end
end