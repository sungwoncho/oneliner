FactoryGirl.define do
  factory :vote do
    association :user, factory: :user
    association :oneline, factory: :oneline
    vote_type 'up'
  end
end
