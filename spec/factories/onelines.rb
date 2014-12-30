FactoryGirl.define do
  factory :oneline do
    subject { Faker::Lorem::sentence }
    definition { Faker::Lorem::sentence }
  end
end
