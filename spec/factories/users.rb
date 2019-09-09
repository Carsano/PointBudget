FactoryBot.define do
  factory :user do
    email { Faker::Internet.email}
    password { Faker::Internet.password}
    first_name { Faker::Name.first_name}
    last_name { Faker::Name.last_name}
    phone_number { '0606060606'}

    factory :user_empty_email do
      first_name {""}
    end
    factory :user_empty_password do
      first_name {""}
    end
  end
end
