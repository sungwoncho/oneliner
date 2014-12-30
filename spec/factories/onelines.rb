FactoryGirl.define do
  factory :oneline do
    subject { Faker::Lorem.word }
    definition { Faker::Lorem.sentence }
  end
end
