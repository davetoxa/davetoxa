FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    sequence(:username){ |u| "User_#{u}" }
    sequence(:uid){ |i| i }

    factory :admin do
      after(:create) do |user|
        Rails.application.config.admins << user.username
      end
    end
  end
end
