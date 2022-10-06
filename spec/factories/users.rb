FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {"abc123"}
    password_confirmation {"abc123"}
    family_name {"イイ田"}
    first_name {"いちこ"}
    family_name_kana {"イイダ"}
    first_name_kana {"イチコ"}
    birthday {Faker::Date.in_date_period}
  end
end