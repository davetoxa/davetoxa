FactoryGirl.define do
  factory :subscribe do
    email Faker::Internet.email
    active true
  end
end
