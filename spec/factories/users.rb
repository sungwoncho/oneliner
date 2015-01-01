FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    email
    username { Faker::Internet.user_name }
    password "pass1234"
  end
end
