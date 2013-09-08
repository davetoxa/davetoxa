FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password 'my_pass'
    admin false
    factory :user_admin do
      admin true
    end
  end
end
