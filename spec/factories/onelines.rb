FactoryGirl.define do
  factory :oneline do
    subject { Faker::Lorem.word }
    definition { Faker::Lorem.sentence }
    author_id 1
  end
end
