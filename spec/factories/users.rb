FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    sequence(:username){ |u| "User - #{u}" }
    sequence(:uid){ |i| i }
  end
end
